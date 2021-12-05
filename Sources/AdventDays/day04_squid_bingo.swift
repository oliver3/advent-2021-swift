import Foundation

class BingoBoard: CustomStringConvertible {
  var grid: [[Int?]] = []

  func addLine(_ line: String) {
    grid.append(line.toIntArray(separator: " "))
  }

  func mark(_ number: Int) {
    for i in grid.indices {
      for j in grid[i].indices {
        if grid[i][j] == number {
          grid[i][j] = nil
        }
      }
    }
  }

  var rows: [[Int?]] {
    return grid
  }

  var columns: [[Int?]] {
    return grid.indices.map { i in
      assert(grid.count == grid[i].count, "grid is not square: (\(grid.count), \(grid[i].count))")
      return grid[i].indices.map { j in
        grid[j][i]
      }
    }
  }

  var bingo: Bool {
    for row in rows {
      if row.allSatisfy({ $0 == nil }) {
        return true
      }
    }
    for col in columns {
      if col.allSatisfy({ $0 == nil }) {
        return true
      }
    }
    return false
  }

  var sumUnmarked: Int {
    return grid
      .map { row in row.reduce(0) { $0 + ($1 ?? 0) } }
      .reduce(0, +)
  }

  var description: String {
    return grid
      .map { line in
        line
          .map { number in
            guard let number = number else {
              return "xx"
            }
            return String(format: "%2d", number)
          }
          .joined(separator: " ")
      }
      .joined(separator: "\n")
      .appending("\n")
  }
}

public func day04PartOne(_ input: [String]) -> Int {
  let numbers: [Int] = input[0].toIntArray(separator: ",")

  let boards = createBoards(input[2...])

  for number in numbers {
    for board in boards {
      board.mark(number)
      if board.bingo {
        return board.sumUnmarked * number
      }
    }
  }

  fatalError("No board won with these numbers")
}

public func day04PartTwo(_ input: [String]) -> Int {
  let numbers: [Int] = input[0].toIntArray(separator: ",")
  var boards = createBoards(input[2...])

  for number in numbers {
    for board in boards {
      board.mark(number)
      if board.bingo, boards.count == 1 {
        return board.sumUnmarked * number
      }
    }
    boards = boards.filter { !$0.bingo }
  }

  fatalError("No single last board won with these numbers")
}

func createBoards(_ input: ArraySlice<String>) -> [BingoBoard] {
  var boards = [BingoBoard()]

  for line in input {
    if line.trimmingCharacters(in: .whitespaces).isEmpty {
      boards.append(BingoBoard())
      continue
    }
    boards.last?.addLine(line)
  }

  return boards
}

extension StringProtocol {
  func toIntArray(separator: Character) -> [Int] {
    return trimmingCharacters(in: .whitespaces)
      .split(separator: separator)
      .compactMap { Int($0) }
  }
}
