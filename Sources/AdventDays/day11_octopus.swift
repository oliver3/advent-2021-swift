import Foundation

public func day11PartOne(_ input: [String]) -> Int {
  let octopuses = Matrix(input, separator: "")
  var flashes = 0

  for _ in 0 ..< 100 {
    flashes += octopuses.energyStep()
  }

  return flashes
}

public func day11PartTwo(_ input: [String]) -> Int {
  let octopuses = Matrix(input, separator: "")
  var step = 0

  while true {
    step += 1
    octopuses.energyStep()
    if octopuses.allSatisfy({ $0 == 0 }) {
      return step
    }
  }
}

extension Matrix {
  func increaseAndFlash(_ index: Vector2) -> Int {
    guard let energy = self[index] else {
      return 0
    }

    self[index] = energy + 1
    if energy + 1 != 10 {
      return 0
    }

    var flashes = 1
    for adjacent in index.adjacentAll() {
      flashes += increaseAndFlash(adjacent)
    }
    return flashes
  }

  @discardableResult
  func energyStep() -> Int {
    var flashes = 0

    // Flash
    for index in indices {
      flashes += increaseAndFlash(index)
    }

    // Reset
    for (index, energy) in enumerated() {
      if energy > 9 {
        self[index] = 0
      }
    }

    return flashes
  }
}
