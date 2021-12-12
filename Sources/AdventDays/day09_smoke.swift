import Foundation

public func day09PartOne(_ input: [String]) -> Int {
  let heightmap = Matrix(input, separator: "")

  return heightmap.enumerated()
    .filter { location, height in
      height < location.adjacent().compactMap { heightmap[$0] }.min()!
    }
    .map { _, height in height + 1 }
    .reduce(0, +)
}

func basinSize(start: Vector2, heightmap: Matrix) -> Int {
  var points = [start]

  while true {
    let newPoints = points
      .flatMap { $0.adjacent() }
      .unique()
      .filter { heightmap[$0] ?? 9 < 9 }
      .filter { !points.contains($0) }

    if newPoints.isEmpty {
      break
    } else {
      points.append(contentsOf: newPoints)
    }
  }

  return points.count
}

public func day09PartTwo(_ input: [String]) -> Int {
  let heightmap = Matrix(input, separator: "")

  let lowPoints = heightmap.enumerated()
    .filter { location, height in
      height < location.adjacent().compactMap { heightmap[$0] }.min()!
    }
    .map { location, _ in location }

  let basinSizes = lowPoints
    .map { basinSize(start: $0, heightmap: heightmap) }
    .sorted(by: >)

  return basinSizes[0] * basinSizes[1] * basinSizes[2]
}

extension Array where Element: Hashable {
  func unique() -> Set<Element> {
    return Set(self)
  }
}
