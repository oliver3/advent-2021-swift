import Foundation

struct Entry {
  var patterns: [String]
  var output: [String]

  init(_ s: String) {
    let parts = s.components(separatedBy: " | ")

    patterns = parts[0].components(separatedBy: " ")
    output = parts[1].components(separatedBy: " ")
  }
}

public func day08PartOne(_ input: [String]) -> Int {
  return input
    .map(Entry.init)
    .map { entry in
      entry.output.reduce(0) { sum, digit in
        let simpleDigit = [2, 4, 3, 7].contains(digit.count)
        return simpleDigit ? (sum + 1) : sum
      }
    }
    .reduce(0, +)
}

let NUMBER_SEGMENTS = [
  "abcefg", "cf", "acdeg", "acdfg", "bcdf", "abdfg", "abdefg", "acf", "abcdefg", "abcdfg",
]

func printSegments() {
  let segmentDisplay = [" aaaa ", "b    c", "b    c", " dddd ", "e    f", "e    f", " gggg "].joined(separator: "\n")

  for number in NUMBER_SEGMENTS.indices {
    var segments = segmentDisplay
    for letter in "abcdefg" {
      if !NUMBER_SEGMENTS[number].contains(letter) {
        segments = segments.replacingOccurrences(of: String(letter), with: "\u{00B7}")
      }
    }
    print(number)
    print(segments)
    print()
  }
}

/// A signature represents for a segment, how many times it occurs in patterns of size x, for each x
/// E.g. "g" -> "00000331" means that the segment g occurs three times in all patterns with lengths 5 and 6,
/// and once in patterns with length 7. This is unique for each segment!
func createSignatures(patterns: [String]) -> [Character: String] {
  let patternCountGroups = Dictionary(grouping: patterns, by: { $0.count })
  var signatures = [Character: String]()

  for segment in "abcdefg" {
    let signature = (0...7)
      .map { group in patternCountGroups[group] ?? [] }
      .map { patterns in String(patterns.count { pattern in pattern.contains(segment) })}
      .joined()
    signatures[segment] = signature
  }

  return signatures
}


/// Use the segment signatures to create a mapping between two segment letter systems, described by the patterns
func createSegmentMapping(fromPatterns: [String], toPatterns: [String]) -> [Character: Character] {
  let fromSignatures: [Character: String] = createSignatures(patterns: fromPatterns)
  let toSignatures: [Character: String] = createSignatures(patterns: toPatterns)

  let fromTo: [(Character, Character)] = fromSignatures.map { from in
    let to = toSignatures.first(where: { $0.value == from.value })!
    return (from.key, to.key)
  }

  return Dictionary(uniqueKeysWithValues: fromTo)
}

/// Map segment letters using a segment mapping
func mapSegments(segmentMapping: [Character: Character], segments: String) -> String {
  return String(segments.map { return segmentMapping[$0]! }.sorted())
}

public func day08PartTwo(_ input: [String]) -> Int {
  return input
    .map(Entry.init)
    .map { entry in
      let mapping = createSegmentMapping(fromPatterns: entry.patterns, toPatterns: NUMBER_SEGMENTS)

      let outputString = entry.output
        .map { pattern in mapSegments(segmentMapping: mapping, segments: pattern) }
        .map { segments in String(NUMBER_SEGMENTS.firstIndex(of: segments)!) }
        .joined()


      return Int(outputString)!
    }
    .reduce(0, +)
}

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}