//
//  Day24.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day24: Day {
    func run(input: String) -> String {
        var walls = Set<Point>()
        var targets = [Int: Point]()
        for (y, line) in input.lines.enumerated() {
            for (x, char) in line.enumerated() {
                let point = Point(x: x, y: y)
                if char == "#" {
                    walls.insert(point)
                } else if let number = char.wholeNumberValue {
                    targets[number] = point
                }
            }
        }
        
        let aStar = AStar(graph: GridGraph(walls: walls), heuristic: Point.distance(between:and:))
        var routes = [Int: [Int: Int]]()
        for start in targets.keys {
            for end in targets.keys where start < end {
                let length = aStar.path(start: targets[start]!, target: targets[end]!).count - 1
                routes[start, default: [:]][end] = length
                routes[end, default: [:]][start] = length
            }
        }
        
        targets.removeValue(forKey: 0)
        var shortestRoute = Int.max
        for var route in targets.keys.permutations() {
            route.insert(0, at: 0)
            shortestRoute = min(shortestRoute, route.adjacentPairs().map { routes[$0.0]![$0.1]! }.sum)
        }
        
        return shortestRoute.description
    }
}
