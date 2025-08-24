// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nbase64Swift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Base64Extension",
            targets: ["Base64Extension"]
        ),
        .library(
            name: "Base404",
            targets: ["Base404"]
        ),
        .executable(
            name: "Base404Example",
            targets: ["Base404Example"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Base64Extension"
        ),
        .target(
            name: "Base404"
        ),
        .executableTarget(
            name: "Base404Example",
            dependencies: ["Base404", "Base64Extension"]
        ),
        .testTarget(
            name: "nbase64SwiftTests",
            dependencies: ["Base64Extension", "Base404"]
        ),
    ]
)