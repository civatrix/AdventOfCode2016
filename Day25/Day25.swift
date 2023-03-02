//
//  Day25.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day25: Day {
    func run(input: String) -> String {
        for signal in 0 ... Int.max {
            let elfCode = ElfCode(input.lines)
            elfCode.registers["a"] = signal
            while elfCode.step() {
                if elfCode.output.contains("00") || elfCode.output.contains("11") { break }
                if elfCode.output.count >= 30 {
                    return signal.description
                }
            }
        }
        
        fatalError("No solution found")
    }
}
