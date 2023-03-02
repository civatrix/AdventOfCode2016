//
//  Day19.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day19: Day {
    func run(input: String) -> String {
        var circle = Array(1 ... Int(input)!)
        while circle.count > 1 {
            let isOdd = !circle.count.isMultiple(of: 2)
            circle = circle.enumerated().filter { $0.offset.isMultiple(of: 2) }.map { $0.element }
            if isOdd {
                circle.removeFirst()
            }
        }
        
        return circle[0].description
    }
}
