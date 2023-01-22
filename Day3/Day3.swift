//
//  Day3.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day3: Day {
    func run(input: String) -> String {
        return input.lines
            .map { $0.allDigits.sorted() }
            .filter { $0.prefix(2).sum > $0[2] }
            .count
            .description
    }
}
