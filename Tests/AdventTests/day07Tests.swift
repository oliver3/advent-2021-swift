@testable import AdventDays
import XCTest

final class Day07Tests: XCTestCase {
    let input = "16,1,2,0,4,2,7,1,2,14"

    func testPartOne() {
        XCTAssertEqual(day07PartOne(input), 37)
    }

    func testExpensiveFuel() {
        XCTAssertEqual(expensiveFuel(6), 21)
        XCTAssertEqual(expensiveFuel(-6), 21)
    }

    func testPartTwo() {
        XCTAssertEqual(day07PartTwo(input), 168)
    }


}
