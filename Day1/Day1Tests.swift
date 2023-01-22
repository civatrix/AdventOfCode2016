//
//  Day1Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testDay() throws {
        let input =
"""
R2, L3
"""
        XCTAssertEqual(day.run(input: input), "5")
    }
    
    func testDay2() throws {
        let input =
"""
R2, R2, R2
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
    
    func testDay3() throws {
        let input =
"""
R5, L5, R5, R3
"""
        XCTAssertEqual(day.run(input: input), "12")
    }
}
