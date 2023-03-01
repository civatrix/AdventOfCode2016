//
//  Day16Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day16Tests: XCTestCase {
    let day = Day16()
    
    func testDay() throws {
        day.diskSize = 20
        let input =
"""
10000
"""
        XCTAssertEqual(day.run(input: input), "01100")
    }
}
