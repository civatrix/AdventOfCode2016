//
//  Day19Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day19Tests: XCTestCase {
    let day = Day19()
    
    func testDay() throws {
        for count in 5 ... 100 {
            print("\(count): \(day.run(input: "\(count)"))")
        }
    }
}
