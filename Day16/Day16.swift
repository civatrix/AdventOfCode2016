//
//  Day16.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day16: Day {
    var diskSize = 272
    
    func run(input: String) -> String {
        var data = input
        while data.count < diskSize {
            let copy = data.reversed().map { $0 == "0" ? "1" : "0" }.joined()
            data = "\(data)0\(copy)"
        }
        
        var checksum = String(data.prefix(diskSize))
        repeat {
            checksum = checksum.chunks(ofCount: 2).map { $0.first == $0.last ? "1" : "0" }.joined()
        } while checksum.count.isMultiple(of: 2)
        
        return checksum
    }
}
