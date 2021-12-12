class Matrix: Equatable, CustomStringConvertible {
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
    get {
      return self[index.i, index.j]
    }
    set(newValue) {
      self[index.i, index.j] = newValue
    }
  }

  subscript(i: Int, j: Int) -> Int? {
    get {
      guard values.indices.contains(i), values[i].indices.contains(j) else {
        return nil
      }

      return values[i][j]
    }
    set(newValue) {
      if let newValue = newValue, values.indices.contains(i), values[i].indices.contains(j) {
        values[i][j] = newValue
      }
    }
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

  func allSatisfy(_ predicate: (Int) throws -> Bool) rethrows -> Bool {
    for (_, value) in enumerated() {
      if try predicate(value) == false {
        return false
      }
    }

    return true
  }

  static func == (lhs: Matrix, rhs: Matrix) -> Bool {
    return lhs.values == rhs.values
  }

  var description: String {
    return "\n" + values.map { line in line.map(String.init).joined() }.joined(separator: "\n") + "\n"
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

  func adjacentOrthogonal() -> [Vector2] {
    return [
      Vector2(i - 1, j),
      Vector2(i, j + 1),
      Vector2(i + 1, j),
      Vector2(i, j - 1),
    ]
  }

  func adjacentDiagonal() -> [Vector2] {
    return [
      Vector2(i - 1, j + 1),
      Vector2(i + 1, j + 1),
      Vector2(i + 1, j - 1),
      Vector2(i - 1, j - 1),
    ]
  }

  func adjacentAll() -> [Vector2] {
    return adjacentOrthogonal() + adjacentDiagonal()
  }
}
