//
//  Day23Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day23Tests: XCTestCase {
    let day = Day23()
    
    func testDay() throws {
        let input =
"""
cpy 2 a
tgl a
tgl a
tgl a
cpy 1 a
dec a
dec a
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
