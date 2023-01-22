//
//  Day6.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day6: Day {
    func run(input: String) -> String {
        let lines = input.lines
        var counts = [[Character: Int]](repeating: [:], count: lines[0].count)
        
        for line in lines {
            for (index, character) in line.enumerated() {
                counts[index][character, default: 0] += 1
            }
        }
        
        return String(counts.map { $0.max { $0.value < $1.value }!.key })
    }
}
