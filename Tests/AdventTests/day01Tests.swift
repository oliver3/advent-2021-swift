@testable import AdventDays
import XCTest

final class Day01Tests: XCTestCase {
    func testDay01PartOne() throws {
        let answer = day01PartOne([199, 200, 208, 210, 200, 207, 240, 269, 260, 263])
        XCTAssertEqual(answer, 7)
    }

    func testDay01PartTwo() throws {
        let answer = day01PartTwo([199, 200, 208, 210, 200, 207, 240, 269, 260, 263])
        XCTAssertEqual(answer, 5)
    }

    func testSlidingWindow() throws {
        XCTAssertEqual(
            [1, 2, 3, 4].slidingWindow(2),
            [[1, 2], [2, 3], [3, 4]]
        )
    }
}
