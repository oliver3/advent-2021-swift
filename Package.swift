// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "advent-2021-swift",
    products: [
        .executable(name: "AdventMain", targets: ["AdventMain"]),
        .library(name: "AdventDays", targets: ["AdventDays"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AdventMain",
            dependencies: ["AdventDays"],
            resources: [.copy("Inputs")]
        ),
        .target(
            name: "AdventDays",
            dependencies: []
        ),
        .testTarget(
            name: "AdventTests",
            dependencies: ["AdventDays"]
        ),
    ]
)
