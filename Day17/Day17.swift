//
//  Day17.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import Crypto

final class Day17: Day {
    func run(input: String) -> String {
        return findPath(hash: input, path: "", position: .zero).sorted { $0.count < $1.count }[0]
    }
    
    func findPath(hash: String, path: String, position: Point) -> [String] {
        if position == [3, 3] { return [path] }
        var validPaths = [String]()
        for exit in exits(for: "\(hash)\(path)", from: position){
            switch exit {
            case .up: validPaths.append(contentsOf: findPath(hash: hash, path: path + "U", position: position + exit))
            case .down: validPaths.append(contentsOf: findPath(hash: hash, path: path + "D", position: position + exit))
            case .left: validPaths.append(contentsOf: findPath(hash: hash, path: path + "L", position: position + exit))
            case .right: validPaths.append(contentsOf: findPath(hash: hash, path: path + "R", position: position + exit))
            default: fatalError("Unknown exit: \(exit)")
            }
        }
        
        return validPaths
    }
    
    func exits(for hashPath: String, from: Point) -> [Point] {
        var hash = Crypto.Insecure.MD5.hash(data: hashPath.data(using: .utf8)!).description.split(separator: " ").last!
        let up = ["b", "c", "d", "e", "f"].contains(hash.popFirst()!) && from.y > 0
        let down = ["b", "c", "d", "e", "f"].contains(hash.popFirst()!) && from.y < 3
        let left = ["b", "c", "d", "e", "f"].contains(hash.popFirst()!) && from.x > 0
        let right = ["b", "c", "d", "e", "f"].contains(hash.first!) && from.x < 3
        
        return [
            up ? Point.up : nil,
            down ? Point.down : nil,
            left ? Point.left : nil,
            right ? Point.right : nil,
        ].compactMap { $0 }
    }
}
