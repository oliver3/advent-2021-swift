import XCTest
@testable import AdventDays

final class Day01Tests: XCTestCase {
    func testDay01() throws {}

    func testSlidingWindow() throws {
        XCTAssertEqual(
            [1, 2, 3, 4].slidingWindow(2),
            [[1, 2], [2, 3], [3, 4]]
        )
    }
}
