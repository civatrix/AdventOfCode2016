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
        let aba = Regex {
            Capture(as: a) { .word }
            NegativeLookahead { a }
            Capture(as: b) { .word }
            a
        }
        
        let hypernetFirst = Regex {
            "["
            ZeroOrMore { .word }
            aba
            ZeroOrMore { .word }
            "]"
            ZeroOrMore { .any }
            b
            a
            b
            ZeroOrMore { .word }
            ChoiceOf {
                Anchor.endOfLine
                "["
            }
        }
        
        let hypernetSecond = Regex {
            ChoiceOf {
                Anchor.startOfLine
                "]"
            }
            ZeroOrMore { .word }
            aba
            ZeroOrMore { .any }
            "["
            ZeroOrMore { .word }
            b
            a
            b
            ZeroOrMore { .word }
            "]"
        }
        
        return input
            .lines
            .filter { $0.firstMatch(of: hypernetFirst) != nil || $0.firstMatch(of: hypernetSecond) != nil }
//            .map { $0.matches(of: abba).map { $0.output.0 }.joined(separator: ", ") }
//            .joined(separator: "\n")
            .count
            .description
    }
}
