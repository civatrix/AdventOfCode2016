//
//  ElfCode.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-12-10.
//

import Foundation
import RegexBuilder

class ElfCode {
    static let regex = Regex {
        Capture {
            One(.word)
            One(.word)
            One(.word)
        }
        " "
        Capture {
            OneOrMore(.word)
        }
        Optionally {
            " "
            Capture {
                Optionally {
                    "-"
                }
                OneOrMore(.word)
            }
        }
    }
    
    enum Instruction {
        case copy(Substring, Substring), increment(Substring), decrement(Substring), jumpNonZero(Substring, Int)
        
        init(_ input: String) {
            guard let match = input.wholeMatch(of: regex)?.output else {
                fatalError("Unknown instruction: \(input)")
            }
            let instruction = match.1
            switch instruction {
            case "cpy": self = .copy(match.2, match.3!)
            case "inc": self = .increment(match.2)
            case "dec": self = .decrement(match.2)
            case "jnz": self = .jumpNonZero(match.2, Int(match.3!)!)
            default:
                fatalError("Unknown instruction: \(input)")
            }
        }
    }
    
    var registers: [Substring: Int] = ["a": 1, "b": 0, "c": 0, "d": 0]
    let instructions: [Instruction]
    var instructionPointer = 0
    
    init(_ lines: [String]) {
        instructions = lines.map(Instruction.init)
    }
    
    func run() -> Int {
        while step() {}
        return registers["a"]!
    }
    
    func step() -> Bool {
        let instruction = instructions[instructionPointer]
        switch instruction {
        case let .copy(lhs, rhs):
            if let number = Int(lhs) {
                registers[rhs] = number
            } else {
                registers[rhs] = registers[lhs]!
            }
        case let .increment(register):
            registers[register]! += 1
        case let .decrement(register):
            registers[register]! -= 1
        case let .jumpNonZero(register, value):
            if (Int(register) ?? registers[register])! != 0 {
                instructionPointer += value - 1
            }
        }
        
        instructionPointer += 1
        return instructionPointer < instructions.count
    }
}
