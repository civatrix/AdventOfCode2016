//
//  Day12Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    func testDay() throws {
        let input =
"""
cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a
"""
        XCTAssertEqual(day.run(input: input), "42")
    }
}
