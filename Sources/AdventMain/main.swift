import AdventDays
import Foundation

let input01 = readInputAsInts("day01")
let input02 = readInput("day02")
let input03 = readInput("day03")
let input04 = readInput("day04")
let input05 = readInput("day05")
let input06 = readInput("day06")[0]

print("Day 01 part one: \(day01PartOne(input01))")
print("Day 01 part two: \(day01PartTwo(input01))")
print()
print("Day 02 part one: \(day02PartOne(input02))")
print("Day 02 part one: \(day02PartTwo(input02))")
print()
print("Day 02 part one (alt): \(day02PartOneAlternative(input02))")
print("Day 02 part one (alt): \(day02PartTwoAlternative(input02))")
print()
print("Day 03 part one: \(day03PartOne(input03))")
print("Day 03 part one: \(day03PartTwo(input03))")
print()
print("Day 04 part one: \(day04PartOne(input04))")
print("Day 04 part two: \(day04PartTwo(input04))")
print()
print("Day 05 part one: \(day05PartOne(input05))")
print("Day 05 part two: \(day05PartTwo(input05))")
print()
print("Day 06 part one: \(day06PartOne(input06))")
print("Day 06 part two: \(day06PartTwo(input06))")
print()

func readInput(_ day: String) -> [String] {
  let file = Bundle.module.url(forResource: "Inputs/\(day)", withExtension: "txt")
  let content = try! String(contentsOf: file!, encoding: .utf8)
  return content
    .trimmingCharacters(in: .whitespacesAndNewlines)
    // Do not forget omittingEmptySubsequences false or else empty lines are not returned wtf
    .split(separator: "\n", omittingEmptySubsequences: false)
    .map(String.init)
}

func readInputAsInts(_ day: String) -> [Int] {
  readInput(day).compactMap { Int($0) }
}
