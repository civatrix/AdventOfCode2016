//
//  Day8.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day8: Day {
    func run(input: String) -> String {
        let rect = Regex {
            "rect "
            TryCapture(OneOrMore(.digit)) { Int($0) }
            "x"
            TryCapture(OneOrMore(.digit)) { Int($0) }
        }
        
        let rotateRow = Regex {
            "rotate row y="
            TryCapture(OneOrMore(.digit)) { Int($0) }
            " by "
            TryCapture(OneOrMore(.digit)) { Int($0) }
        }
        
        let rotateColumn = Regex {
            "rotate column x="
            TryCapture(OneOrMore(.digit)) { Int($0) }
            " by "
            TryCapture(OneOrMore(.digit)) { Int($0) }
        }
        
        var lights = Set<Point>()
        for line in input.lines {
            if let match = line.wholeMatch(of: rect)?.output {
                for x in 0 ..< match.1 {
                    for y in 0 ..< match.2 {
                        lights.insert([x, y])
                    }
                }
            } else if let match = line.wholeMatch(of: rotateRow)?.output {
                var row = lights.filter { $0.y == match.1 }
                lights.subtract(row)
                lights.formUnion(row.map { Point(x: ($0.x + match.2) % 50, y: $0.y)})
            } else if let match = line.wholeMatch(of: rotateColumn)?.output {
                var column = lights.filter { $0.x == match.1 }
                lights.subtract(column)
                lights.formUnion(column.map { Point(x: $0.x, y: ($0.y + match.2) % 6)})
            } else {
                fatalError("Unknown instruction: \(line)")
            }
        }
        
        return lights.count.description
    }
}
