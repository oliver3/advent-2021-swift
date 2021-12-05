@testable import AdventDays
import XCTest

final class Day05Tests: XCTestCase {
    let input = [
        "0,9 -> 5,9",
        "8,0 -> 0,8",
        "9,4 -> 3,4",
        "2,2 -> 2,1",
        "7,0 -> 7,4",
        "6,4 -> 2,0",
        "0,9 -> 2,9",
        "3,4 -> 1,4",
        "0,0 -> 8,8",
        "5,5 -> 8,2",
    ]

    func testParse0() {
        let expected = [[0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9]]
        let actual = enumerateStraightVent(input[0])

        XCTAssertEqual(expected, actual)
    }

    func testParse2() {
        let expected = [[9, 4], [8, 4], [7, 4], [6, 4], [5, 4], [4, 4], [3, 4]]
        let actual = enumerateStraightVent(input[2])

        XCTAssertEqual(expected, actual)
    }

    func testParse3() {
        let expected = [[2, 2], [2, 1]]
        let actual = enumerateStraightVent(input[3])

        XCTAssertEqual(expected, actual)
    }

    func testPartOne() {
        XCTAssertEqual(day05PartOne(input), 5)
    }

    func testPartTwo() {
        XCTAssertEqual(day05PartTwo(input), 12)
    }

}
