//
//  Day11.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

struct Floor: Hashable {
    var generators: Set<Substring>, microchips: Set<Substring>
    var totalItems: Int {
        generators.count + microchips.count
    }
}

struct CacheKey: Hashable {
    let floors: [Floor]
    let number: Int
}

final class Day11: Day {
    func run(input: String) -> String {
        let generator = /(\w*) generator/
        let microchip = /(\w*)-compatible microchip/
        
        let lines = input.lines
        var floors = [Floor](repeating: Floor(generators: [], microchips: []), count: lines.count)
        floors[0].generators.formUnion(["elerium", "dilithium"])
        floors[0].microchips.formUnion(["elerium", "dilithium"])
        
        for (floor, line) in lines.enumerated() {
            line.matches(of: generator).forEach { floors[floor].generators.insert($0.output.1) }
            line.matches(of: microchip).forEach { floors[floor].microchips.insert($0.output.1) }
        }
        
        let totalItems = floors.map { $0.totalItems }.sum
        
        var queue = Queue<(floors: [Floor], floor: Int, move: Int)>()
        var cache = Set<CacheKey>()
        var best = Int.max
        
        func addToQueue(_ new: [Floor], floor: Int, move: Int) {
            let key = CacheKey(floors: new, number: floor)
            guard move < best, !cache.contains(key), isValid(state: new) else { return }
            
            cache.insert(key)
            queue.append((floors: new, floor: floor, move: move))
            
            if new.last!.totalItems == totalItems {
                best = move
                queue = queue.filter { $0.move < best }
            }
        }
        
        queue.append((floors, floor: 0, move: 0))
        let validFloors = 0 ..< lines.count
        while let current = queue.dequeue() {
            let nextMove = current.move + 1
            for nextFloor in [1, -1].map({ current.floor + $0 }) where validFloors.contains(nextFloor) {
                // Don't move back down to empty floors
                if (0 ... nextFloor).allSatisfy({ current.floors[$0].totalItems == 0 }) { continue }
                
                let chips = current.floors[current.floor].microchips
                let generators = current.floors[current.floor].generators
                                
                // Move two chips
                for var chips in Set(chips.permutations(ofCount: 2).map { Set($0) }) {
                    let firstMove = move(microchip: chips.removeFirst(), from: current.floor, to: nextFloor, in: current.floors)
                    let secondMove = move(microchip: chips.first!, from: current.floor, to: nextFloor, in: firstMove)
                    addToQueue(secondMove, floor: nextFloor, move: nextMove)
                }
                
                
                // Move one chip
                for chip in chips {
                    addToQueue(move(microchip: chip, from: current.floor, to: nextFloor, in: current.floors), floor: nextFloor, move: nextMove)
                }
                                
                // Move one generator
                for generator in generators {
                    addToQueue(move(generator: generator, from: current.floor, to: nextFloor, in: current.floors), floor: nextFloor, move: nextMove)
                }
                
                // Move two generators
                for var generators in Set(generators.permutations(ofCount: 2).map({ Set($0) })) {
                    let firstMove = move(generator: generators.removeFirst(), from: current.floor, to: nextFloor, in: current.floors)
                    let secondMove = move(generator: generators.first!, from: current.floor, to: nextFloor, in: firstMove)
                    addToQueue(secondMove, floor: nextFloor, move: nextMove)
                }
                
                // Move one generator and one chip
                for pair in Set(current.floors[current.floor].microchips).intersection(current.floors[current.floor].generators) {
                    addToQueue(move(microchip: pair, generator: pair, from: current.floor, to: nextFloor, in: current.floors), floor: nextFloor, move: nextMove)
                }
            }
        }
        
        return best.description
    }
    
    func move(microchip: Substring? = nil, generator: Substring? = nil, from: Int, to: Int, in floors: [Floor]) -> [Floor] {
        var mutable = floors
        if let microchip {
            mutable[from].microchips.remove(microchip)
            mutable[to].microchips.insert(microchip)
        }
        
        if let generator {
            mutable[from].generators.remove(generator)
            mutable[to].generators.insert(generator)
        }
        
        return mutable
    }
    
    func isValid(state: [Floor]) -> Bool {
        for floor in state where !floor.generators.isEmpty {
            if !floor.microchips.allSatisfy({ floor.generators.contains($0) }) {
                return false
            }
        }
        
        return true
    }
}
