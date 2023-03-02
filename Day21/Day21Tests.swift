//
//  Day21Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day21Tests: XCTestCase {
    let day = Day21()
    
    func testDayFull() throws {
        day.startingPassword = "abcde"
        let input =
"""
swap position 4 with position 0
swap letter d with letter b
reverse positions 0 through 4
rotate left 1 step
move position 1 to position 4
move position 3 to position 0
rotate based on position of letter b
rotate based on position of letter d
"""
        XCTAssertEqual(day.run(input: input), "decab")
    }
    
    func testDay1() throws {
        day.startingPassword = "abcde"
        let input =
"""
swap position 4 with position 0
"""
        XCTAssertEqual(day.run(input: input), "ebcda")
    }
    
    func testDay2() throws {
        day.startingPassword = "ebcda"
        let input =
"""
swap letter d with letter b
"""
        XCTAssertEqual(day.run(input: input), "edcba")
    }
    
    func testDay3() throws {
        day.startingPassword = "edcba"
        let input =
"""
reverse positions 0 through 4
"""
        XCTAssertEqual(day.run(input: input), "abcde")
    }
    
    func testDay4() throws {
        day.startingPassword = "abcde"
        let input =
"""
rotate left 1 step
"""
        XCTAssertEqual(day.run(input: input), "bcdea")
    }
    
    func testDay5() throws {
        day.startingPassword = "bcdea"
        let input =
"""
move position 1 to position 4
"""
        XCTAssertEqual(day.run(input: input), "bdeac")
    }
    
    func testDay6() throws {
        day.startingPassword = "bdeac"
        let input =
"""
move position 3 to position 0
"""
        XCTAssertEqual(day.run(input: input), "abdec")
    }
    
    func testDay7() throws {
        day.startingPassword = "abdec"
        let input =
"""
rotate based on position of letter b
"""
        XCTAssertEqual(day.run(input: input), "ecabd")
    }
    
    func testDay8() throws {
        day.startingPassword = "ecabd"
        let input =
"""
rotate based on position of letter d
"""
        XCTAssertEqual(day.run(input: input), "decab")
    }
}
