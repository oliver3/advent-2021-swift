@testable import AdventDays
import XCTest

final class Day02Tests: XCTestCase {
    func testSubmarineCommand() throws {
        let cmd = SubmarineCommand("up 3")
        XCTAssertEqual(cmd, .up(3))
    }

    func testSubmarineCommandAdd() throws {
        let position = SubmarinePosition()
            .move(.forward(3))
            .move(.down(4))
            .move(.up(3))

        XCTAssertEqual(position, SubmarinePosition(horizontal: 3, depth: 1))
    }

    func testDay02PartOne() throws {
        let answer = day02PartOne(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"])
        XCTAssertEqual(answer, 150)
    }

    func testDay02PartTwo() throws {
        let answer = day02PartTwo(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"])
        XCTAssertEqual(answer, 900)
    }

    func testDay02PartOneAlt() throws {
        let answer = day02PartOneAlternative(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"])
        XCTAssertEqual(answer, 150)
    }

    func testDay02PartTwoAlt() throws {
        let answer = day02PartTwoAlternative(["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"])
        XCTAssertEqual(answer, 900)
    }

}
