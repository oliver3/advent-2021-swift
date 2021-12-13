import Foundation

public func day12PartOne(_ input: [String]) -> Int {
  let connections = parseConnections(input)
  return findPaths(connections: connections, begin: ["start"]) { path, cave in
    cave.isUppercase || !path.contains(cave)
  }.count
}

func parseConnections(_ input: [String]) -> [String: Set<String>] {
  let connections: [(from: String, to: String)] = input
    .map { $0.components(separatedBy: "-") }
    .flatMap { [(from: $0[0], to: $0[1]), (from: $0[1], to: $0[0])] }

  return Dictionary(grouping: connections, by: \.from) .mapValues { Set($0.map(\.to)) }
}

func findPaths(connections: [String: Set<String>], begin: [String], conditions: ([String], String) -> Bool) -> [[String]] {
  if begin.last == "end" {
    return [begin]
  }

  guard let lastCave = begin.last, let nextCaves = connections[lastCave] else {
    fatalError("Could not find any next caves for \(begin.last)")
  }

  return nextCaves
    .filter { conditions(begin, $0) }
    .flatMap { cave in
      findPaths(connections: connections, begin: begin + [cave], conditions: conditions)
    }
}

public func day12PartTwo(_ input: [String]) -> Int {
  let connections = parseConnections(input)
  return findPaths(connections: connections, begin: ["start"]) { path, cave in
    cave != "start" && (cave.isUppercase || !path.contains(cave) || !smallCaveTwice(path) )
  }.count
}

func smallCaveTwice(_ path: [String]) -> Bool {
  let smallCaves = path.filter { $0 != "start" && !$0.isUppercase }
  return smallCaves.count > Set(smallCaves).count
}


extension String {
  var isUppercase: Bool {
    return allSatisfy { $0.isUppercase }
  }
}
