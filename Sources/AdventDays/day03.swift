
public func day03PartOne(_ input: [String]) -> Int {
  let zeros = [Int](repeating: 0, count: input[0].count)

  let bitSum = input
    .reduce(zeros) { bitSum, binary in
      let bits = binary.map { char in char.binaryValue() }
      return zip(bitSum, bits).map(+)
    }

  let gamma = bitSum
    .map { $0 > input.count / 2 ? "1" : "0" }
    .joined()
    .binaryValue()

  let epsilon = bitSum
    .map { $0 < input.count / 2 ? "1" : "0" }
    .joined()
    .binaryValue()

  return gamma * epsilon
}

public func day03PartTwo(_ input: [String]) -> Int {
  let oxygenGeneratorRating = filterBitCriteria(operand: >=, numbers: input)
  let co2ScrubberRating = filterBitCriteria(operand: <, numbers: input)

  return oxygenGeneratorRating.binaryValue() * co2ScrubberRating.binaryValue()
}

func filterBitCriteria(operand: (Int, Int) -> Bool, numbers: [String], position: Int = 0) -> String {
  let sum = numbers.reduce(0) { $0 + $1[position].binaryValue() }
  let mostCommon: Character = operand(sum * 2, numbers.count) ? "1" : "0"
  let remaining = numbers.filter { $0[position] == mostCommon }

  if remaining.count == 1 {
    return remaining[0]
  }

  return filterBitCriteria(operand: operand, numbers: remaining, position: position + 1)
}


extension String {
  func binaryValue() -> Int {
    return Int(self, radix: 2)!
  }

  subscript(_ offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}

extension Character {
  func binaryValue() -> Int {
    return self == "1" ? 1 : 0
  }
}

