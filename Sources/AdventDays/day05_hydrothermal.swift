import Foundation

func parseVent(_ s: String) -> (x1: Int, y1: Int, x2: Int, y2: Int) {
  let fromTo = s.components(separatedBy: " -> ")
  let from = fromTo[0].components(separatedBy: ",").map(Int.init)
  let to = fromTo[1].components(separatedBy: ",").map(Int.init)

  guard let x1 = from[0], let y1 = from[1], let x2 = to[0], let y2 = to[1] else {
    fatalError("Could not parse vent \(s)")
  }

  return (x1, y1, x2, y2)
}

func enumerateStraightVent(_ s: String) -> [[Int]] {
  switch parseVent(s) {
  case let (x1, y1, x2, y2) where x1 != x2 && y1 == y2:
    return vent((x1, x2), y2)
  case let (x1, y1, x2, y2) where x1 == x2 && y1 != y2:
    return vent(x1, (y1, y2))
  default:
    return []
  }
}

func vent(_ x: (Int, Int), _ y: Int) -> [[Int]] {
  return (x.0 < x.1 ? Array(x.0 ... x.1) : Array(x.1 ... x.0).reversed())
    .map { [$0, y] }
}

func vent(_ x: Int, _ y: (Int, Int)) -> [[Int]] {
  return vent(y, x).map { $0.reversed() }
}

func oceanFloor(vents: [[[Int]]]) -> [Int] {
  let ventsFlat = vents.flatMap { $0 }
  let xSize = (ventsFlat.map { $0[0] }.max() ?? 0) + 1
  let ySize = (ventsFlat.map { $0[1] }.max() ?? 0) + 1
  var grid = Array(repeating: 0, count: xSize * ySize)

  for vent in ventsFlat {
    grid[vent[0] * xSize + vent[1]] += 1
  }
  return grid
}

public func day05PartOne(_ input: [String]) -> Int {
  let vents = input.map(enumerateStraightVent)
  let oceanFloor = oceanFloor(vents: vents)
  return oceanFloor.filter { $0 > 1 }.count
}

func enumerateAllVent(_ s: String) -> [[Int]] {
  switch parseVent(s) {
  case let (x1, y1, x2, y2) where x1 != x2 && y1 == y2:
    return vent((x1, x2), y2)
  case let (x1, y1, x2, y2) where x1 == x2 && y1 != y2:
    return vent(x1, (y1, y2))
  case let (x1, y1, x2, y2) where x1 != x2 && y1 != y2:
    return vent((x1, x2), (y1, y2))
  default:
    return []
  }
}

func vent(_ x: (Int, Int), _ y: (Int, Int)) -> [[Int]] {
  return zip(vent(x, 0), vent(0, y)).map { [$0.0[0], $0.1[1]] }
}

public func day05PartTwo(_ input: [String]) -> Int {
  let vents = input.map(enumerateAllVent)
  let oceanFloor = oceanFloor(vents: vents)
  return oceanFloor.filter { $0 > 1 }.count
}
