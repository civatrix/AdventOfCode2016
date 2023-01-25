//
//  Day12.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day12: Day {
    func run(input: String) -> String {
        let cpu = ElfCode(input.lines)
        cpu.registers["c"] = 1
        
        return cpu.run().description
    }
}
