//
//  Day19.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day19: Day {
    func run(input: String) -> String {
        if Int(input)! > 100000 {
            return "Solved by hand"
        }
        
        var circle = Array(1 ... Int(input)!)
        var current = 0
        while circle.count > 1 {
            let target = ((circle.count / 2) + current) % circle.count
            circle.remove(at: target)
            if target < current {
                current -= 1
            }
            current = (current + 1) % circle.count
        }
        
        return circle[0].description
    }
}
