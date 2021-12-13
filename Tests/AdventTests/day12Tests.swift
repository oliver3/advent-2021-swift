@testable import AdventDays
import XCTest

final class Day12Tests: XCTestCase {
    let input = [
        "start-A",
        "start-b",
        "A-c",
        "A-b",
        "b-d",
        "A-end",
        "b-end",
    ]

    func testFindConnectedCaves() {
        let connections = parseConnections(input)
        let expected: Set = ["b", "end", "start", "c"]
        XCTAssertEqual(connections["A"], expected)
    }

    func testPartOne() {
        XCTAssertEqual(day12PartOne(input), 10)
    }

    func testPartTwo() {
        XCTAssertEqual(day12PartTwo(input), 36)
    }

    func testPartTwoLargest() {
        let input = [
            "fs-end",
            "he-DX",
            "fs-he",
            "start-DX",
            "pj-DX",
            "end-zg",
            "zg-sl",
            "zg-pj",
            "pj-he",
            "RW-he",
            "fs-DX",
            "pj-RW",
            "zg-RW",
            "start-pj",
            "he-WI",
            "zg-he",
            "pj-fs",
            "start-RW",
        ]
        XCTAssertEqual(day12PartTwo(input), 3509)
    }
}
