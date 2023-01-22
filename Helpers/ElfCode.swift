//
//  ElfCode.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-12-10.
//

import Foundation

class ElfCode {
    enum Instruction {
        case half(Substring), triple(Substring), increment(Substring), jump(Int), jumpEven(Substring, Int), jumpOne(Substring, Int)
        
        init(_ input: String) {
            guard let match = input.wholeMatch(of: /(\w+) (([^+-])|([+-]\d+))(, ([+-]\d+))?/)?.output else {
                fatalError("Unknown instruction: \(input)")
            }
            let instruction = match.1
            switch instruction {
            case "hlf": self = .half(match.2)
            case "tpl": self = .triple(match.2)
            case "inc": self = .increment(match.2)
            case "jmp": self = .jump(Int(match.2)!)
            case "jie": self = .jumpEven(match.2, Int(match.6!)!)
            case "jio": self = .jumpOne(match.2, Int(match.6!)!)
            default:
                fatalError("Unknown instruction: \(input)")
            }
        }
    }
    
    var registers: [Substring: Int] = ["a": 1, "b": 0]
    let instructions: [Instruction]
    var instructionPointer = 0
    
    init(_ lines: [String]) {
        instructions = lines.map(Instruction.init)
    }
    
    func run() {
        while step() {}
    }
    
    func step() -> Bool {
        let instruction = instructions[instructionPointer]
        switch instruction {
        case let .half(register):
            registers[register]! /= 2
        case let .triple(register):
            registers[register]! *= 3
        case let .increment(register):
            registers[register]! += 1
        case let .jump(value):
            instructionPointer += value - 1
        case let .jumpEven(register, value):
            if registers[register]! % 2 == 0 {
                instructionPointer += value - 1
            }
        case let .jumpOne(register, value):
            if registers[register]! == 1 {
                instructionPointer += value - 1
            }
        }
        
        instructionPointer += 1
        return instructionPointer < instructions.count
    }
}
