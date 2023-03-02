//
//  Day20.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day20: Day {
    func run(input: String) -> String {
        let ranges = input.lines.map { line in
            let lhs = Int(line.split(separator: "-")[0])!
            let rhs = Int(line.split(separator: "-")[1])!
            return lhs ... rhs
        }
        var minimumAddress = 0
        var validAddresses = 0
        
        while true {
            while let range = ranges.first(where: { $0.contains(minimumAddress) }) {
                minimumAddress = range.upperBound + 1
            }
            
            if minimumAddress > UInt32.max {
                break
            }
            validAddresses += 1
            minimumAddress += 1
        }
        
        return validAddresses.description
    }
}
