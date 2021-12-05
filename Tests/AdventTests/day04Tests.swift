@testable import AdventDays
import XCTest

final class Day04Tests: XCTestCase {
    let input = [
        "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1",
        "",
        "22 13 17 11  0",
        " 8  2 23  4 24",
        "21  9 14 16  7",
        " 6 10  3 18  5",
        " 1 12 20 15 19",
        "",
        " 3 15  0  2 22",
        " 9 18 13 17  5",
        "19  8  7 25 23",
        "20 11 10 24  4",
        "14 21 16 12  6",
        "",
        "14 21 17 24  4",
        "10 16 15  9 19",
        "18  8 23 26 20",
        "22 11 13  6  5",
        " 2  0 12  3  7",
    ]

    func testBoardDescription() {
        let input = [
            "22 13 17 11  0",
            " 8  2 23  4 24",
            "21  9 14 16  7",
            " 6 10  3 18  5",
            " 1 12 20 15 19",
        ]

        let expected = input
            .joined(separator: "\n")
            .appending("\n")
            .replacingOccurrences(of: "18", with: "xx")

        let board = BingoBoard(input: input)
        board.mark(18)

        XCTAssertEqual(board.description, expected)
    }

    func testBoardRowsColumns() {
        let input = [
            "22 13 17 11  0",
            " 8  2 23  4 24",
            "21  9 14 16  7",
            " 6 10  3 18  5",
            " 1 12 20 15 19",
        ]

        let board = BingoBoard(input: input)
        XCTAssertEqual(board.rows[0], [22, 13, 17, 11, 0])
        XCTAssertEqual(board.columns[0], [22, 8, 21, 6, 1])
    }

    func testBoardMark() {
        let input = [
            "22 13 17 11  0",
            " 8  2 23  4 24",
            "21  9 14 16  7",
            " 6 10  3 18  5",
            " 1 12 20 15 19",
        ]

        let board = BingoBoard(input: input)
        board.mark(6)
        XCTAssertEqual(board.columns[0], [22, 8, 21, nil, 1])
    }

    func testBoardSum() {
        let input = [
            "22 13 17 11  0",
            " 8  2 23  4 24",
            "21  9 14 16  7",
            " 6 10  3 18  5",
            " 1 12 20 15 19",
        ]

        let board = BingoBoard(input: input)
        XCTAssertEqual(board.sumUnmarked, 22 + 13 + 17 + 11 + 8 + 2 + 23 + 4 + 24 + 21 + 9 + 14 + 16 + 7 + 6 + 10 + 3 + 18 + 5 + 1 + 12 + 20 + 15 + 19)
        board.mark(6)
        XCTAssertEqual(board.sumUnmarked, 22 + 13 + 17 + 11 + 8 + 2 + 23 + 4 + 24 + 21 + 9 + 14 + 16 + 7 + 10 + 3 + 18 + 5 + 1 + 12 + 20 + 15 + 19)
    }

    func testBoardBingo() {
        let input = [
            "22 13 17 11  0",
            " 8  2 23  4 24",
            "21  9 14 16  7",
            " 6 10  3 18  5",
            " 1 12 20 15 19",
        ]

        let board = BingoBoard(input: input)
        for number in [22, 8, 21, 6] {
            board.mark(number)
            XCTAssertEqual(board.bingo, false)
        }

        board.mark(1)
        XCTAssertEqual(board.bingo, true)
    }

    func testPartOne() throws {
        XCTAssertEqual(day04PartOne(input), 4512)
    }

    func testPartTwo() throws {
        XCTAssertEqual(day04PartTwo(input), 1924)
    }
}

extension BingoBoard {
    convenience init(input: [String]) {
        self.init()
        for line in input {
            addLine(line)
        }
    }
}
