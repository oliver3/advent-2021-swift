@testable import AdventDays
import XCTest

final class Day10Tests: XCTestCase {
    let input = [
        "[({(<(())[]>[[{[]{<()<>>",
        "[(()[<>])]({[<{<<[]>>(",
        "{([(<{}[<>[]}>{[]{[(<()>",
        "(((({<>}<{<{<>}{[]{[]{}",
        "[[<[([]))<([[{}[[()]]]",
        "[{[{({}]{}}([{[{{{}}([]",
        "{<[[]]>}<{[{[{[]{()[[[]",
        "[<(<(<(<{}))><([]([]()",
        "<{([([[(<>()){}]>(<<{{",
        "<{([{{}}[<[[[<>{}]]]>[]]",
    ]

    func testIllegalSyntax() {
        XCTAssertEqual(checkSyntax("{([(<{}[<>[]}>{[]{[(<()>"), .corrupted(score: 1197))
    }

    func testIncompleteSyntax() {
        XCTAssertEqual(checkSyntax("[({(<(())[]>[[{[]{<()<>>"), .incomplete(score: 288957))
    }

    func testPartOne() {
        XCTAssertEqual(day10PartOne(input), 26397)
    }

    func testPartTwo() {
        XCTAssertEqual(day10PartTwo(input), 288957)
    }
}
