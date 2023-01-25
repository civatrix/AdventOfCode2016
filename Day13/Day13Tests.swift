//
//  Day13Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    func testDay() throws {
        let input =
"""
10
"""
        XCTAssertEqual(day.run(input: input), "11")
    }
}
