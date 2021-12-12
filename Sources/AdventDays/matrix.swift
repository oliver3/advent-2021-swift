class Matrix {
  var values: [[Int]]

  init(_ values: [[Int]]) {
    // copy
    self.values = values.map { $0.map { $0 }}
  }

  init(_ lines: [String], separator: String) {
    values = lines.map { line in
      let parts = separator != "" ? line.components(separatedBy: separator) : line.map { char in String(char) }

      return parts.map { part in
        if let value = Int(part) {
          return value
        } else {
          fatalError("Unknown number \"\(part)\" in line \"\(line)\"")
        }
      }
    }
  }

  subscript(index: Vector2) -> Int? {
    return self[index.i, index.j]
  }

  subscript(i: Int, j: Int) -> Int? {
    guard values.indices.contains(i), values[i].indices.contains(j) else {
      return nil
    }

    return values[i][j]
  }

  var indices: [Vector2] {
    return values.indices.flatMap { i in
      values[i].indices.map { j in
        Vector2(i, j)
      }
    }
  }

  func enumerated() -> [(index: Vector2, value: Int)] {
    return indices.map { ($0, self[$0]!) }
  }
}

struct Vector2: Equatable, Hashable, CustomStringConvertible {
  var i: Int
  var j: Int

  var description: String {
    "(\(i), \(j))"
  }

  init(_ i: Int, _ j: Int) {
    self.i = i
    self.j = j
  }

  func adjacent() -> [Vector2] {
    return [
      Vector2(i - 1, j),
      Vector2(i, j + 1),
      Vector2(i + 1, j),
      Vector2(i, j - 1),
    ]
  }


}
