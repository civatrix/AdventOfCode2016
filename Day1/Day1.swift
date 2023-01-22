//
//  Day1.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day1: Day {
    func run(input: String) -> String {
        let instructions = input.matches(of: /([RL])(\d+)/).map { $0.output }
        
        var point = Point.zero
        var direction = Point.up
        for instruction in instructions {
            direction = direction.rotate(clockwise: instruction.1 == "R")
            point += direction * Int(instruction.2)!
        }
        
        return point.distance(to: .zero).description
    }
}
