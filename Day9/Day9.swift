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
        let sectorLength = Reference(Int.self)
        let repeatCount = Reference(Int.self)
        
        let marker = Regex {
            "("
            TryCapture(as: sectorLength) { OneOrMore(.digit) } transform: { Int($0) }
            "x"
            TryCapture(as: repeatCount) { OneOrMore(.digit) } transform: { Int($0) }
            ")"
        }
        
        var workingInput = input.replacing(.whitespace, with: "")
        var output = ""
        while let match = workingInput.firstMatch(of: marker) {
            output += workingInput[workingInput.startIndex ..< match.range.lowerBound]
            let repeatSection = workingInput[match.range.upperBound ..< workingInput.index(match.range.upperBound, offsetBy: match[sectorLength])]
            (0 ..< match[repeatCount]).forEach { _ in output += repeatSection }
            workingInput = String(workingInput[workingInput.index(match.range.upperBound, offsetBy: match[sectorLength])...])
        }
        output += workingInput
        
        return output.count.description
    }
}
