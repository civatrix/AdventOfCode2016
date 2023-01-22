//
//  Day7.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day7: Day {
    func run(input: String) -> String {
        let a = Reference(Substring.self)
        let b = Reference(Substring.self)
        let abba = Regex {
            Capture(as: a) { .any }
            NegativeLookahead { a }
            Capture(as: b) { .any }
            b
            a
        }
        
        let hypernet = Regex {
            "["
            ZeroOrMore { .word }
            abba
            ZeroOrMore { .word }
            "]"
        }
        
        return input
            .lines
            .filter { $0.firstMatch(of: hypernet) == nil && $0.firstMatch(of: abba) != nil }
//            .map { $0.matches(of: abba).map { $0.output.0 }.joined(separator: ", ") }
//            .joined(separator: "\n")
            .count
            .description
    }
}
