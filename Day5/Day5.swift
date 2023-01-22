//
//  Day5.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import Crypto

final class Day5: Day {
    func run(input: String) -> String {
        let salt = input.trimmingCharacters(in: .newlines)
        var output = [Character](repeating: "*", count: 8)
        var index = 0
        while output.contains("*") {
            let key = "\(salt)\(index)"
            let hash = Crypto.Insecure.MD5.hash(data: key.data(using: .utf8)!).description.split(separator: " ").last!
            if hash.prefix(5) == "00000" {
                if let index = Int(String(hash[hash.index(hash.startIndex, offsetBy: 5)])), index <= 7, output[index] == "*" {
                    output[index] = hash[hash.index(hash.startIndex, offsetBy: 6)]
                }
            }
            index += 1
        }
        
        return String(output)
    }
}
