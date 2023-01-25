//
//  Day13.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day13: Day {
    func run(input: String) -> String {
        let salt = Int(input.trimmingCharacters(in: .newlines))!
    
        var visited = Set<Point>([[1,1]])
        var newlyVisited = Set<Point>([[1,1]])
        var step = 0
        while step < 50 {
            newlyVisited = Set(newlyVisited.flatMap {
                $0.adjacent
                    .filter { $0.x >= 0 && $0.y >= 0 }
                    .filter { $0.isOpen(salt) }
            }).subtracting(visited)
            visited.formUnion(newlyVisited)
            step += 1
        }
        
        return visited.count.description
    }
    
}

private extension Point {
    func isOpen(_ salt: Int) -> Bool {
        var number = (x * x) + (3 * x) + (2 * x * y) + y + (y * y) + salt
        var ones = 0
        while number > 0 {
            ones += (number & 1) == 1 ? 1 : 0
            number >>= 1
        }
        
        return ones.isMultiple(of: 2)
    }
}
