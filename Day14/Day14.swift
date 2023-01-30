//
//  Day14.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import Crypto

final class Day14: Day {
    let triple = /(.)\1\1/
    let quintuple = /(.)\1\1\1\1/
    
    func run(input: String) -> String {
        var possibleKeys = [(Character, Int)]()
        var keys = [Int]()
        
        var index = 0
        while keys.count < 64 {
            possibleKeys = possibleKeys.filter { $0.1 + 1000 >= index }
            let key = Crypto.Insecure.MD5.hash(data: "\(input)\(index)".data(using: .utf8)!).description.split(separator: " ").last!
            for match in key.matches(of: quintuple) {
                let foundCharacter = match.output.1.first!
                possibleKeys = possibleKeys.filter {
                    if foundCharacter == $0.0 {
                        keys.append($0.1)
                        return false
                    }
                    
                    return true
                }
            }
            
            if let match = key.firstMatch(of: triple)?.output {
                possibleKeys.append((match.1.first!, index))
            }
            
            index += 1
        }
        
        return keys.sorted().prefix(64).last!.description
    }
}
