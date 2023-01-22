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
        
        var visited = Set<Point>([.zero])
        var point = Point.zero
        var direction = Point.up
    outerLoop: for instruction in instructions {
        direction = direction.rotate(clockwise: instruction.1 == "R")
        for _ in 0 ..< Int(instruction.2)! {
            point += direction
            if visited.contains(point) {
                break outerLoop
            } else {
                visited.insert(point)
            }
        }
    }
        
        return point.distance(to: .zero).description
    }
}
