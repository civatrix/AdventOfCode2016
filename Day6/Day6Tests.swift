//
//  Day6Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    func testDay() throws {
        let input =
"""
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
"""
        XCTAssertEqual(day.run(input: input), "easter")
    }
}
