@testable import AdventDays
import XCTest

let input = [
    "2199943210",
    "3987894921",
    "9856789892",
    "8767896789",
    "9899965678",
]

let heightMap = Matrix(input, separator: "")

final class Day09Tests: XCTestCase {
    func testPartOne() {
        XCTAssertEqual(day09PartOne(input), 15)
    }

    func testBasinSize00() {
        XCTAssertEqual(basinSize(start: Vector2(0, 0), heightmap: heightMap), 3)
    }

    func testBasinSize09() {
        XCTAssertEqual(basinSize(start: Vector2(0, 9), heightmap: heightMap), 9)
    }

    func testBasinSize22() {
        XCTAssertEqual(basinSize(start: Vector2(2, 2), heightmap: heightMap), 14)
    }

    func testBasinSize46() {
        XCTAssertEqual(basinSize(start: Vector2(4, 6), heightmap: heightMap), 9)
    }

    func testPartTwo() {
        XCTAssertEqual(day09PartTwo(input), 1134)
    }
}
