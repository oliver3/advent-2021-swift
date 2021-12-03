@testable import AdventDays
import XCTest

final class Day03Tests: XCTestCase {
    let input = [
        "00100", "11110", "10110", "10111", "10101", "01111",
        "00111", "11100", "10000", "11001", "00010", "01010",
    ]

    func testDay03PartOne() throws {
        XCTAssertEqual(day03PartOne(input), 198)
    }

    func testDay03PartTwo() throws {
        XCTAssertEqual(day03PartTwo(input), 230)
    }
}
