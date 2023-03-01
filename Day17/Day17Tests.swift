//
//  Day17Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day17Tests: XCTestCase {
    let day = Day17()
    
    func testDay() throws {
        let input =
"""
ihgpwlah
"""
        XCTAssertEqual(day.run(input: input), "370")
    }
    
    func testDay2() throws {
        let input =
"""
kglvqrro
"""
        XCTAssertEqual(day.run(input: input), "492")
    }
    
    func testDay3() throws {
        let input =
"""
ulqzkmiv
"""
        XCTAssertEqual(day.run(input: input), "830")
    }
}
