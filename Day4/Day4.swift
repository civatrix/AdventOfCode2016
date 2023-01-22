//
//  Day4.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day4: Day {
    func run(input: String) -> String {
        let name = Reference(Substring.self)
        let id = Reference(Int.self)
        let checksum = Reference(Substring.self)
        let regex = Regex {
            Capture(as: name) {
                OneOrMore(ChoiceOf {
                    .word
                    "-"
                })
            } transform: {
                $0.replacing("-", with: " ")
            }
            "-"
            TryCapture(as: id) {
                OneOrMore(.digit)
            } transform: {
                Int($0)
            }
            "["
            Capture(as: checksum) { OneOrMore(.word) }
            "]"
        }
        
        return input.lines
            .map { $0.wholeMatch(of: regex)! }
            .filter { String(sorted(byLetterFrequency: $0[name]).prefix(5)) == $0[checksum] }
            .filter { line in
                let id = line[id]
                return String(line[name].map { rotate($0, by: id)}).contains("northpole")
            }
            .first![id]
            .description
    }
    
    let a = Int(Character("a").asciiValue!)
    func rotate(_ character: Character, by: Int) -> Character {
        guard character != " " else { return character }
        return Character(UnicodeScalar(UInt8(((Int(character.asciiValue!) - a + by) % 26) + a)))
    }
    
    func sorted(byLetterFrequency string: Substring) -> [Character] {
        letterCounts(of: string.replacing(" ", with: ""))
            .sorted {
                if $0.value == $1.value {
                    return $0.key < $1.key
                } else {
                    return $0.value > $1.value
                }
            }
            .map { $0.key }
    }
    
    func letterCounts(of string: Substring) -> [Character: Int] {
        var totals = [Character: Int]()
        for character in string {
            totals[character, default: 0] += 1
        }
        
        return totals
    }
}
