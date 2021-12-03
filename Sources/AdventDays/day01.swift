func day01() {}

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
