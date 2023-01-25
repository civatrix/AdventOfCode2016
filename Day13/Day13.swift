//
//  Day13.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day13: Day {
    struct InfiniteGridGraph: Graph {
        struct Edge: WeightedEdge {
            let cost = 1
            let target: Point
        }
        
        let salt: Int
        
        func edgesOutgoing(from vertex: Point) -> [Edge] {
            return [
                vertex + .up,
                vertex + .down,
                vertex + .left,
                vertex + .right,
            ].filter { $0.isOpen(salt) }
                .map(Edge.init(target:))
        }
    }
    
    func run(input: String) -> String {
        let salt = Int(input.trimmingCharacters(in: .newlines))!
        let aStar = AStar(graph: InfiniteGridGraph(salt: salt), heuristic: Point.distance(between:and:))
        
        return (aStar.path(start: [1,1], target: [31,39]).count - 1).description
    }
}

private extension Point {
    func isOpen(_ salt: Int) -> Bool {
        var number = (x * x) + (3 * x) + (2 * x * y) + y + (y * y) + salt
        var ones = 0
        while number > 0 {
            ones += (number & 1) == 1 ? 1 : 0
            number >>= 1
        }
        
        return ones.isMultiple(of: 2)
    }
}
