@testable import AdventDays
import XCTest

final class MatrixTests: XCTestCase {
  func testMapInit() {
    let input = [
      "2199943210",
      "3987894921",
      "9856789892",
      "8767896789",
      "9899965678",
    ]

    let matrix = Matrix(input, separator: "")
    XCTAssertEqual(matrix[0, 0], 2)
    XCTAssertEqual(matrix[1, 1], 9)
    XCTAssertEqual(matrix[4, 9], 8)
    XCTAssertEqual(matrix[20, 20], nil)
  }
}

final class Vector2Tests: XCTestCase {
  func testAdjacent() {
    XCTAssertEqual(Vector2(4, 5).adjacent(), [
      Vector2(3, 5),
      Vector2(4, 6),
      Vector2(5, 5),
      Vector2(4, 4),
    ])
  }
}
