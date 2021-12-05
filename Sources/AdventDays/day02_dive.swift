struct SubmarinePosition: Equatable {
  var horizontal: Int = 0
  var depth: Int = 0

  func move(_ cmd: SubmarineCommand) -> SubmarinePosition {
    switch cmd {
    case let .forward(units):
      return SubmarinePosition(horizontal: horizontal + units, depth: depth)
    case let .down(units):
      return SubmarinePosition(horizontal: horizontal, depth: depth + units)
    case let .up(units):
      return SubmarinePosition(horizontal: horizontal, depth: depth - units)
    }
  }

  func multiply() -> Int {
    return horizontal * depth
  }
}

enum SubmarineCommand: Equatable {
  case forward(Int)
  case down(Int)
  case up(Int)

  init(_ s: String) {
    let split = s.split(separator: " ")

    switch (split[0], Int(split[1])) {
    case let ("forward", .some(units)):
      self = .forward(units)
    case let ("down", .some(units)):
      self = .down(units)
    case let ("up", .some(units)):
      self = .up(units)
    default:
      fatalError("Unknown SubmarineCommand \"\(s)\"")
    }
  }
}

public func day02PartOne(_ input: [String]) -> Int {
  return input
    .map(SubmarineCommand.init)
    .reduce(SubmarinePosition(), { pos, cmd in pos.move(cmd) })
    .multiply()
}

struct SubmarinePositionWithAim: Equatable {
  var horizontal: Int = 0
  var depth: Int = 0
  var aim: Int = 0

  func move(_ cmd: SubmarineCommand) -> SubmarinePositionWithAim {
    switch cmd {
    case let .forward(units):
      return SubmarinePositionWithAim(horizontal: horizontal + units, depth: depth + (aim * units), aim: aim)
    case let .down(units):
      return SubmarinePositionWithAim(horizontal: horizontal, depth: depth, aim: aim + units)
    case let .up(units):
      return SubmarinePositionWithAim(horizontal: horizontal, depth: depth, aim: aim - units)
    }
  }

  func multiply() -> Int {
    return horizontal * depth
  }
}


public func day02PartTwo(_ input: [String]) -> Int {
  return input
    .map(SubmarineCommand.init)
    .reduce(SubmarinePositionWithAim(), { pos, cmd in pos.move(cmd) })
    .multiply()
}

