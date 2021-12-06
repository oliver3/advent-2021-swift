import Foundation

func parseFish(_ s: String) -> [Int] {
  return s.components(separatedBy: ",").compactMap { Int($0) }
}

/// Naive implementation, array elements represent the age of an individual lanternfish
func lanternfishNextDay(_ fish: [Int]) -> [Int] {
  return fish.flatMap { $0 > 0 ? [$0 - 1] : [6, 8] }
}

public func day06PartOne(_ input: String) -> Int {
  var fish = parseFish(input)

  for _ in 0 ..< 80 {
    fish = lanternfishNextDay(fish)
  }

  return fish.count
}

func countFish(_ input: [Int]) -> [Int] {
  var fishCount = Array(repeating: 0, count: 9)

  for fish in input {
    fishCount[fish] += 1
  }

  return fishCount
}

/// More smart implementation, array elements represent the number of fish with age equal to array index
func lanternfishCountNextDay(_ fishCount: [Int]) -> [Int] {
  var nextFishCount = fishCount

  // Every lanterfish ages a day (shift left in array, remove < 0)
  let spawn = nextFishCount.removeFirst()
  // New lanterfish
  nextFishCount.append(spawn)
  // Reset lanternfish
  nextFishCount[6] += spawn

  return nextFishCount
}

public func day06PartOneAlternative(_ input: String) -> Int {
  var fishCount = countFish(parseFish(input))

  for _ in 0 ..< 80 {
    fishCount = lanternfishCountNextDay(fishCount)
  }

  return fishCount.reduce(0, +)
}

public func day06PartTwo(_ input: String) -> Int {
  var fishCount = countFish(parseFish(input))

  for _ in 0 ..< 256 {
    fishCount = lanternfishCountNextDay(fishCount)
  }

  return fishCount.reduce(0, +)
}
