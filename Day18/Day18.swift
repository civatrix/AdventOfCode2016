//
//  Day18.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day18: Day {
    var roomSize = 400000
    
    func run(input: String) -> String {
        var row = input
        var index = 1
        var safeCount = input.filter { $0 == "." }.count
        
        while index < roomSize {
            var nextRow = ""
            for index in row.indices {
                let left = index == row.startIndex ? "." : row[row.index(before: index)]
                let right = row[safe: row.index(after: index)] ?? "."
                
                if left != right {
                    nextRow += "^"
                } else {
                    safeCount += 1
                    nextRow += "."
                }
            }
            
            row = nextRow
            index += 1
        }
        
        return safeCount.description
    }
}
