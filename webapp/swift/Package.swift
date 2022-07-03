// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "suzuki",
    platforms: [
        .macOS(.v11),
    ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "suzuki",
            dependencies: [
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
