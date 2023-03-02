//
//  Day21.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day21: Day {
    var startingPassword = "fbgdceah"
    
    let swapPosition = /swap position (.) with position (.)/
    let swapLetter = /swap letter (.) with letter (.)/
    let rotate = /rotate (left|right) (.) steps?/
    let rotateLetter = /rotate based on position of letter (.)/
    let reverse = /reverse positions (.) through (.)/
    let move = /move position (.) to position (.)/
    
    func run(input: String) -> String {
        for permutation in startingPassword.map({ $0 }).permutations() {
            if scramble(start: permutation, input: input) == startingPassword {
                return String(permutation)
            }
        }
        
        fatalError("No match found")
    }
    
    func scramble(start: [Character], input: String) -> String {
        var password = start
        for line in input.lines {
            if let match = line.wholeMatch(of: swapPosition)?.output {
                let from = Int(match.1)!
                let to = Int(match.2)!
                password.swapAt(from, to)
            } else if let match = line.wholeMatch(of: swapLetter)?.output {
                let from = password.firstIndex(of: Character(String(match.1)))!
                let to = password.firstIndex(of: Character(String(match.2)))!
                password.swapAt(from, to)
            } else if let match = line.wholeMatch(of: rotate)?.output {
                let steps = Int(match.2)!
                let newStart: Int
                if match.1 == "left" {
                    newStart = steps
                } else {
                    newStart = (password.count - steps) % password.count
                }
                password.rotate(toStartAt: newStart)
            } else if let match = line.wholeMatch(of: rotateLetter)?.output {
                var from = password.firstIndex(of: Character(String(match.1)))! + 1
                if from > 4 {
                    from += 1
                }
                let newStart = password.count - (from % password.count)
                password.rotate(toStartAt: newStart)
            } else if let match = line.wholeMatch(of: reverse)?.output {
                let from = Int(match.1)!
                let to = Int(match.2)!
                password.reverse(subrange: from ..< to + 1)
            } else if let match = line.wholeMatch(of: move)?.output {
                let from = Int(match.1)!
                let to = Int(match.2)!
                password.insert(password.remove(at: from), at: to)
            } else {
                fatalError("Invalid instruction: \(line)")
            }
        }
        
        return String(password)
    }
}
