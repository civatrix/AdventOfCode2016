//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    func testDay() throws {
        let input =
"""
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
"""
        XCTAssertEqual(day.run(input: input), "1514")
    }
}
