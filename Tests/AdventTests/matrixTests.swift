@testable import AdventDays
import XCTest

final class MatrixTests: XCTestCase {
  let input = [
    "2199943210",
    "3987894921",
    "9856789892",
    "8767896789",
    "9899965678",
  ]

  func testMapInit() {
    let matrix = Matrix(input, separator: "")
    XCTAssertEqual(matrix[0, 0], 2)
    XCTAssertEqual(matrix[1, 1], 9)
    XCTAssertEqual(matrix[4, 9], 8)
    XCTAssertEqual(matrix[20, 20], nil)
  }

  func testSubscript() {
    let matrix = Matrix(input, separator: "")
    XCTAssertEqual(matrix[1, 1], 9)
    matrix[1, 1] = 10
    XCTAssertEqual(matrix[1, 1], 10)
    matrix[Vector2(1, 1)] = 11
    XCTAssertEqual(matrix[1, 1], 11)
  }
}

final class Vector2Tests: XCTestCase {
  func testAdjacentOrthogonal() {
    XCTAssertEqual(Vector2(4, 5).adjacentOrthogonal(), [
      Vector2(3, 5),
      Vector2(4, 6),
      Vector2(5, 5),
      Vector2(4, 4),
    ])
  }

  func testAdjacentDiagonal() {
    XCTAssertEqual(Vector2(4, 5).adjacentDiagonal(), [
      Vector2(3, 6),
      Vector2(5, 6),
      Vector2(5, 4),
      Vector2(3, 4),
    ])
  }

  func testAdjacentAll() {
    XCTAssertEqual(Vector2(4, 5).adjacentAll(), [
      Vector2(3, 5),
      Vector2(4, 6),
      Vector2(5, 5),
      Vector2(4, 4),
      Vector2(3, 6),
      Vector2(5, 6),
      Vector2(5, 4),
      Vector2(3, 4),
    ])
  }
}
