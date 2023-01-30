//
//  Day15Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day15Tests: XCTestCase {
    let day = Day15()
    
    func testDay() throws {
        let input =
"""
Disc #1 has 5 positions; at time=0, it is at position 4.
Disc #2 has 2 positions; at time=0, it is at position 1.
"""
        XCTAssertEqual(day.run(input: input), "85")
    }
}
