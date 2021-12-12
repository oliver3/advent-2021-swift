@testable import AdventDays
import XCTest

final class Day09Tests: XCTestCase {
    let input = [
        "2199943210",
        "3987894921",
        "9856789892",
        "8767896789",
        "9899965678",
    ]

    func testPartOne() {
        XCTAssertEqual(day09PartOne(input), 15)
    }

    func testBasinSize() {
        let heightMap = Matrix(input, separator: "")

        XCTAssertEqual(basinSize(start: Vector2(0, 0), heightmap: heightMap), 3)
        XCTAssertEqual(basinSize(start: Vector2(0, 9), heightmap: heightMap), 9)
        XCTAssertEqual(basinSize(start: Vector2(2, 2), heightmap: heightMap), 14)
        XCTAssertEqual(basinSize(start: Vector2(4, 6), heightmap: heightMap), 9)
    }

    func testPartTwo() {
        XCTAssertEqual(day09PartTwo(input), 1134)
    }
}
