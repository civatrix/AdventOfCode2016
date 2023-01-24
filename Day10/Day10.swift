//
//  Day10.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day10: Day {
    enum Target {
        case bot(Substring)
        case output(Substring)
    }
    
    func run(input: String) -> String {
        var bots = [Substring: [Int]]()
        var output = [Substring: Int]()
        var instructions = [Substring: (low: Target, high: Target)]()
        
        for line in input.lines {
            if let match = line.wholeMatch(of: /value (\d+) goes to bot (\d+)/)?.output {
                bots[match.2, default: []].append(Int(match.1)!)
            } else if let match = line.wholeMatch(of: /bot (\d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/)?.output {
                let low = match.2 == "bot" ? Target.bot(match.3) : Target.output(match.3)
                let high = match.4 == "bot" ? Target.bot(match.5) : Target.output(match.5)
                instructions[match.1] = (low: low, high: high)
            } else {
                fatalError("Unknown instruction: \(line)")
            }
        }
        
        assert(bots.first { $0.value.count > 2 } == nil)
    
        while let bot = bots.first(where: { $0.value.count == 2 }) {
            let chips = bots.removeValue(forKey: bot.key)!
            let instruction = instructions[bot.key]!
            
            let low = chips.min()!
            let high = chips.max()!
            
            switch instruction.low {
            case let .output(key): output[key] = low
            case let .bot(key): bots[key, default: []].append(low)
            }
            
            switch instruction.high {
            case let .output(key): output[key] = high
            case let .bot(key): bots[key, default: []].append(high)
            }
        }
        
        return (output["0"]! * output["1"]! * output["2"]!).description
    }
}
