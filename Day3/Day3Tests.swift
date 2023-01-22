//
//  Day3Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testDay() throws {
        let input =
"""
5 5 3
10 10 4
25 12 5
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
}
