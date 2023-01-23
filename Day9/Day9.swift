//
//  Day9.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day9: Day {
    func run(input: String) -> String {
        return length(of: Substring(input.replacing(.whitespace, with: ""))).description
    }
    
    func length(of string: Substring) -> Int {
        let sectorLength = Reference(Int.self)
        let repeatCount = Reference(Int.self)
        
        let marker = Regex {
            "("
            TryCapture(as: sectorLength) { OneOrMore(.digit) } transform: { Int($0) }
            "x"
            TryCapture(as: repeatCount) { OneOrMore(.digit) } transform: { Int($0) }
            ")"
        }
        
        var workingInput = string
        var output = 0
        while let match = workingInput.firstMatch(of: marker) {
            output += workingInput[workingInput.startIndex ..< match.range.lowerBound].count
            let repeatSection = workingInput[match.range.upperBound ..< workingInput.index(match.range.upperBound, offsetBy: match[sectorLength])]
            output += match[repeatCount] * length(of: repeatSection)
            workingInput = workingInput[workingInput.index(match.range.upperBound, offsetBy: match[sectorLength])...]
        }
        output += workingInput.count
        
        return output
    }
}
