//
//  Day2.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day2: Day {
    func run(input: String) -> String {
        let instructions = input.lines.map { $0.map { $0 } }
        
        var point = Point(x: 1, y: 1)
        var output = ""
        
        for instruction in instructions {
            for step in instruction {
                switch step {
                case "U":
                    point += .up
                case "D":
                    point += .down
                case "L":
                    point += .left
                case "R":
                    point += .right
                default: fatalError("Unknown step \(step) in instruction \(instruction)")
                }
                
                point = [point.x.clamped(to: 0 ... 2), point.y.clamped(to: 0 ... 2)]
            }
            
            output += "\((point.y * 3) + point.x + 1)"
        }
        
        return output
    }
}
