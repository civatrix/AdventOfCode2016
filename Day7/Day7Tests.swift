//
//  Day7Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    func testDay() throws {
        let input =
"""
aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
