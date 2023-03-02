//
//  Day24Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day24Tests: XCTestCase {
    let day = Day24()
    
    func testDay() throws {
        let input =
"""
###########
#0.1.....2#
#.#######.#
#4.......3#
###########
"""
        XCTAssertEqual(day.run(input: input), "14")
    }
}
