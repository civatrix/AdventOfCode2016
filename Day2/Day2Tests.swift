//
//  Day2Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testDay() throws {
        let input =
"""
ULL
RRDDD
LURDL
UUUUD
"""
        XCTAssertEqual(day.run(input: input), "5DB3")
    }
}
