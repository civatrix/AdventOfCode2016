//
//  Day5Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    func testDay() throws {
        let input =
"""
abc
"""
        XCTAssertEqual(day.run(input: input), "18f47a30")
    }
}
