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
        
        let mapping: [Point: String] = [
            [2,0]: "1",
            [1,1]: "2",
            [2,1]: "3",
            [3,1]: "4",
            [0,2]: "5",
            [1,2]: "6",
            [2,2]: "7",
            [3,2]: "8",
            [4,2]: "9",
            [1,3]: "A",
            [2,3]: "B",
            [3,3]: "C",
            [2,4]: "D",
        ]
        var point = Point(x: 0, y: 2)
        var output = ""
        
        for instruction in instructions {
            for step in instruction {
                let move: Point
                switch step {
                case "U":
                    move = .up
                case "D":
                    move = .down
                case "L":
                    move = .left
                case "R":
                    move = .right
                default: fatalError("Unknown step \(step) in instruction \(instruction)")
                }
                
                if mapping[point + move] != nil {
                    point += move
                }
            }
            
            output += mapping[point]!
        }
        
        return output
    }
}
