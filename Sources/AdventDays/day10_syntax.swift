import Foundation

enum Syntax: Equatable {
  case valid
  case corrupted(score: Int)
  case incomplete(score: Int)

  var corruptedScore: Int? {
    switch self {
    case let .corrupted(score): return score
    default: return nil
    }
  }

  var incompleteScore: Int? {
    switch self {
    case let .incomplete(score): return score
    default: return nil
    }
  }
}

public func day10PartOne(_ input: [String]) -> Int {
  return input
    .map { line in checkSyntax(line) }
    .compactMap { $0.corruptedScore }
    .reduce(0, +)
}

public func day10PartTwo(_ input: [String]) -> Int {
  let scores = input
    .map { line in checkSyntax(line) }
    .compactMap { $0.incompleteScore }
    .sorted()

  return scores[scores.count / 2]
}

func checkSyntax(_ line: String) -> Syntax {
  var stack = [Character]()

  // Corrupted
  for char in line {
    switch (stack.last, char) {
    case ("(", ")"), ("[", "]"), ("{", "}"), ("<", ">"): stack.removeLast()
    case (_, "("), (_, "["), (_, "{"), (_, "<"): stack.append(char)
    case (_, ")"): return .corrupted(score: 3)
    case (_, "]"): return .corrupted(score: 57)
    case (_, "}"): return .corrupted(score: 1197)
    case (_, ">"): return .corrupted(score: 25137)
    default: fatalError("Unknown char \(char)")
    }
  }

  // Incomplete
  if stack.count > 0 {
    let score = stack.reversed().reduce(0) { total, char in
      switch char {
      case "(": return total * 5 + 1
      case "[": return total * 5 + 2
      case "{": return total * 5 + 3
      case "<": return total * 5 + 4
      default: fatalError("Unknown char \(char)")
      }
    }
    return .incomplete(score: score)
  } else {
    return .valid
  }
}
