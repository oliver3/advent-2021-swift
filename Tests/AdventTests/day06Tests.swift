@testable import AdventDays
import XCTest

final class Day06Tests: XCTestCase {
    let input = "3,4,3,1,2"

    func testNextDay() {
        let expected = parseFish("2,3,2,0,1")
        let actual = lanternfishNextDay(parseFish(input))

        XCTAssertEqual(expected.sorted(), actual.sorted())
    }

    func testPartOne() {
        XCTAssertEqual(day06PartOne(input), 5934)
    }

    func testFishCount() {
        XCTAssertEqual(countFish(parseFish(input)), [0, 1, 1, 2, 1, 0, 0, 0, 0])
    }

    func testPartOneAlternative() {
        XCTAssertEqual(day06PartOneAlternative(input), 5934)
    }

    func testPartTwo() {
        XCTAssertEqual(day06PartTwo(input), 26_984_457_539)
    }
}
