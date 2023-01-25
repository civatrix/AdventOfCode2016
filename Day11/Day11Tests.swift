//
//  Day11Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testDay() throws {
        let input =
"""
The first floor contains a hydrogen-compatible microchip and a lithium-compatible microchip.
The second floor contains a hydrogen generator.
The third floor contains a lithium generator.
The fourth floor contains nothing relevant.
"""
        XCTAssertEqual(day.run(input: input), "11")
    }
}
