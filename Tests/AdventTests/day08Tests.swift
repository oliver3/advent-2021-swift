@testable import AdventDays
import XCTest

final class Day08Tests: XCTestCase {
    let input = [
        "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe",
        "edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc",
        "fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg",
        "fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb",
        "aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea",
        "fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb",
        "dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe",
        "bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef",
        "egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb",
        "gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce",
    ]

    func testPartOne() {
        XCTAssertEqual(day08PartOne(input), 26)
    }

    func testCreateSignatures() {
        XCTAssertEqual(createSignatures(patterns: NUMBER_SEGMENTS), [
            "a": "00010331",
            "b": "00001131",
            "c": "00111221",
            "d": "00001321",
            "e": "00000121",
            "f": "00111231",
            "g": "00000331",
        ])
    }

    func testCreateMapping() {
        let patterns = Entry(input[0]).patterns
        XCTAssertEqual(createSegmentMapping(fromPatterns: patterns, toPatterns: NUMBER_SEGMENTS), [
            "d": "a", "c": "d", "e": "f", "f": "g", "b": "c", "g": "b", "a": "e",
        ])
    }

    func testMapOutput() {
        let entry = Entry(input[0])
        let mapping = createSegmentMapping(fromPatterns: entry.patterns, toPatterns: NUMBER_SEGMENTS)
        XCTAssertEqual(mapSegments(segmentMapping: mapping, segments: entry.output[0]), "abcdefg")
    }

    func testPartTwo() {
        XCTAssertEqual(day08PartTwo(input), 61229)
    }
}
