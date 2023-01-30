//
//  Day15.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day15: Day {
    let regex = Regex {
        "Disc #"
        One(.digit)
        " has "
        TryCapture(OneOrMore(.digit)) { Int($0) }
        " positions; at time=0, it is at position "
        TryCapture(OneOrMore(.digit)) { Int($0) }
        "."
    }
    func run(input: String) -> String {
        var discs = input.lines.map {
            let match = $0.wholeMatch(of: regex)!
            return (size: match.1, start: match.2)
        }
        discs.append((size: 11, start: 0))
        
        var time = 0
        while true {
            if discs.enumerated().allSatisfy({ (time + $0.offset + 1 + $0.element.start) % $0.element.size == 0 }) {
                return time.description
            }
            
            time += 1
        }
    }
}
