//
//  Day20Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day20Tests: XCTestCase {
    let day = Day20()
    
    func testDay() throws {
        let input =
"""
5-8
0-2
4-7
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
