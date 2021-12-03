import AdventDays
import Foundation

let input01 = readInputAsInts("day01")

print("Day 01 part one: \(day01PartOne(input01))")
print("Day 01 part two: \(day01PartTwo(input01))")


func readInput(_ day: String) -> [Substring] {
  let file = Bundle.module.url(forResource: "Inputs/\(day)", withExtension: "txt")
  let content = try! String(contentsOf: file!, encoding: .utf8)
  return content
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .split(separator: "\n")
}

func readInputAsInts(_ day: String) -> [Int] {
  readInput(day).compactMap { Int($0) }
}
