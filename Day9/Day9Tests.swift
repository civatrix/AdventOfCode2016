//
//  Day9Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    func testDay() throws {
        XCTAssertEqual(day.run(input: "ADVENT"), "6")
        XCTAssertEqual(day.run(input: "A(1x5)BC"), "7")
        XCTAssertEqual(day.run(input: "(3x3)XYZ"), "9")
        XCTAssertEqual(day.run(input: "A(2x2)BCD(2x2)EFG"), "11")
        XCTAssertEqual(day.run(input: "(6x1)(1x3)A"), "6")
        XCTAssertEqual(day.run(input: "X(8x2)(3x3)ABCY"), "18")
    }
}
