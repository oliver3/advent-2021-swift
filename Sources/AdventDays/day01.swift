public func day01PartOne(_ input: [Int]) -> Int {
  return input
    .slidingWindow(2)
    .filter { $0[0] < $0[1] }
    .count
}

public func day01PartTwo(_ input: [Int]) -> Int {
  return input
    .slidingWindow(3)
    .map { $0.reduce(0, +) }
    .slidingWindow(2)
    .filter { $0[0] < $0[1] }
    .count
}

public extension Array {
  func slidingWindow(_ size: Int) -> [[Element]] {
    guard size <= count else { return [] }

    var result: [[Element]] = []
    for i in (size - 1) ..< count {
      let start = i - size + 1
      // https://developer.apple.com/documentation/swift/arrayslice  "Slices Maintain Indices"
      let nextSequence = Array(self[start ... i])
      result.append(nextSequence)
    }

    return result
  }
}
