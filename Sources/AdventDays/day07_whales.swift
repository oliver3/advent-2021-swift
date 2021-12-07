import Foundation

public func day07PartOne(_ input: String) -> Int {
  let crabs = input.components(separatedBy: ",").compactMap { Int($0) }
  let medianCrab = crabs.sorted()[crabs.count / 2]
  let totalFuel = crabs.reduce(0) { $0 + abs($1 - medianCrab) }
  return totalFuel
}

func expensiveFuel(_ dist: Int) -> Int {
  return abs(dist) * (abs(dist) + 1) / 2
}

public func day07PartTwo(_ input: String) -> Int {
  let crabs = input.components(separatedBy: ",").compactMap { Int($0) }
  var guess = crabs.sorted()[crabs.count / 2]

  func totalFuel(_ position: Int) -> Int {
    return crabs.reduce(0) { total, crab in total + expensiveFuel(crab - position) }
  }

  while true {
    if totalFuel(guess - 1) < totalFuel(guess) {
      guess -= 1
    } else if totalFuel(guess + 1) < totalFuel(guess) {
      guess += 1
    } else {
      break
    }
  }

  return totalFuel(guess)
}
