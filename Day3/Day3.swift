//
//  Day3.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day3: Day {
    func run(input: String) -> String {
        return input.allDigits
            .chunks(ofCount: 9)
            .flatMap { [[$0[n: 0], $0[n: 3], $0[n: 6]], [$0[n: 1], $0[n: 4], $0[n: 7]], [$0[n: 2], $0[n: 5], $0[n: 8]]] }
            .map { $0.sorted() }
            .filter { $0.prefix(2).sum > $0[2] }
            .count
            .description
    }
}
