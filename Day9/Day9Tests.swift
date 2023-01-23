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
        XCTAssertEqual(day.run(input: "(3x3)XYZ"), "9")
        XCTAssertEqual(day.run(input: "X(8x2)(3x3)ABCY"), "XABCABCABCABCABCABCY".count.description)
        XCTAssertEqual(day.run(input: "(27x12)(20x12)(13x14)(7x10)(1x12)A"), "241920")
        XCTAssertEqual(day.run(input: "(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN"), "445")
    }
}
