//
//  Day22.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day22: Day {
    struct Node: Hashable {
        static let regex = Regex {
            ZeroOrMore(.any)
            "-x"
            TryCapture { OneOrMore(.digit) } transform: { Int($0) }
            "-y"
            TryCapture { OneOrMore(.digit) } transform: { Int($0) }
            OneOrMore(.whitespace)
            TryCapture { OneOrMore(.digit) } transform: { Int($0) }
            "T"
            OneOrMore(.whitespace)
            TryCapture { OneOrMore(.digit) } transform: { Int($0) }
            "T"
            OneOrMore(.whitespace)
            TryCapture { OneOrMore(.digit) } transform: { Int($0) }
            "T"
            ZeroOrMore(.any)
        }
        
        let position: Point
        let size, used, available: Int
        
        init(string: String) {
            let match = string.wholeMatch(of: Self.regex)!.output
            position = [match.1, match.2]
            size = match.3
            used = match.4
            available = match.5
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(position)
        }
        
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.position == rhs.position
        }
    }
    
    func run(input: String) -> String {
        let nodes = input.lines.dropFirst(2).map(Node.init(string:)).sorted { $0.position < $1.position }
        var output = ""
        
        for node in nodes {
            if node.position.x == 0 {
                output += "\n"
            }
            
            if node.used == 0 {
                output += "_"
            } else if node.used > 100 {
                output += "#"
            } else {
                output += "."
            }
        }
        
        return output
    }
}
