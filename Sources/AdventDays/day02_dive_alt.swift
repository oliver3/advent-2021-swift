
public func day02PartOneAlternative(_ input: [String]) -> Int {
  let position = input
    .reduce((0, 0), { (position, cmd) in
      let (horizontal, depth) = position
      let split = cmd.split(separator: " ")

      switch (split[0], Int(split[1])) {
      case let ("forward", .some(units)):
        return (horizontal + units, depth)
      case let ("down", .some(units)):
        return (horizontal, depth + units)
      case let ("up", .some(units)):
        return (horizontal, depth - units)
      default:
        fatalError("Unknown SubmarineCommand \(cmd)")
      }
    })

    return position.0 * position.1
}

public func day02PartTwoAlternative(_ input: [String]) -> Int {
  let position = input
    .reduce((0, 0, 0), { (position, cmd) in
      let (horizontal, depth, aim) = position
      let split = cmd.split(separator: " ")

      switch (split[0], Int(split[1])) {
      case let ("forward", .some(units)):
        return (horizontal + units, depth + aim * units, aim)
      case let ("down", .some(units)):
        return (horizontal, depth, aim + units)
      case let ("up", .some(units)):
        return (horizontal, depth, aim - units)
      default:
        fatalError("Unknown SubmarineCommand \(cmd)")
      }
    })

    return position.0 * position.1
}

