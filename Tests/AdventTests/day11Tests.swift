@testable import AdventDays
import XCTest

final class Day11Tests: XCTestCase {
    let input = [
        "5483143223",
        "2745854711",
        "5264556173",
        "6141336146",
        "6357385478",
        "4167524645",
        "2176841721",
        "6882881134",
        "4846848554",
        "5283751526",
    ]

    func testOneStep() {
        let octopuses = Matrix([
            "11111",
            "19991",
            "19191",
            "19991",
            "11111",
        ], separator: "")

        let flashes = octopuses.energyStep()

        XCTAssertEqual(octopuses, Matrix([
            "34543",
            "40004",
            "50005",
            "40004",
            "34543",
        ], separator: ""))

        XCTAssertEqual(flashes, 9)
    }

    func testPartOne() {
        XCTAssertEqual(day11PartOne(input), 1656)
    }

    func testPartTwo() {
        XCTAssertEqual(day11PartTwo(input), 195)
    }
}
