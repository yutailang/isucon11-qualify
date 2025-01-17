// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IsuCondition",
    platforms: [
      .macOS(.v10_15), .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "IsuConditionModel",
            targets: ["IsuConditionModel"]),
        .library(
            name: "IsuConditionClient",
            targets: ["IsuConditionClient"]),
        .library(
            name: "IsuConditionOperations",
            targets: ["IsuConditionOperations"]),
        .library(
            name: "IsuConditionOperationsHTTP1",
            targets: ["IsuConditionOperationsHTTP1"]),
        .executable(
            name: "IsuConditionService",
            targets: ["IsuConditionService"]),
        ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", from: "2.7.0"),
        .package(url: "https://github.com/amzn/smoke-aws-credentials.git", from: "2.0.0"),
        .package(url: "https://github.com/amzn/smoke-aws.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/amzn/smoke-framework-application-generate", from: "3.0.0-beta.1"),
        .package(url: "https://github.com/vapor/mysql-kit.git", from: "4.5.0"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "IsuConditionModel", dependencies: [
                .product(name: "SmokeOperations", package: "smoke-framework"),
                .product(name: "Logging", package: "swift-log"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateModel", package: "smoke-framework-application-generate")
            ]),
        .target(
            name: "IsuConditionOperations", dependencies: [
                .target(name: "IsuConditionModel"),
                .product(name: "MySQLKit", package: "mysql-kit"),
            ]),
        .target(
            name: "IsuConditionOperationsHTTP1", dependencies: [
                .target(name: "IsuConditionOperations"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateHttp1", package: "smoke-framework-application-generate")
            ]),
        .target(
            name: "IsuConditionClient", dependencies: [
                .target(name: "IsuConditionModel"),
                .product(name: "SmokeOperationsHTTP1", package: "smoke-framework"),
                .product(name: "SmokeAWSHttp", package: "smoke-aws"),
            ],
            plugins: [
                .plugin(name: "SmokeFrameworkGenerateClient", package: "smoke-framework-application-generate")
            ]),
        .executableTarget(
            name: "IsuConditionService", dependencies: [
                .target(name: "IsuConditionOperationsHTTP1"),
                .product(name: "SmokeAWSCredentials", package: "smoke-aws-credentials"),
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
            ]),
        .testTarget(
            name: "IsuConditionOperationsTests", dependencies: [
                .target(name: "IsuConditionOperations"),
            ]),
        ],
        swiftLanguageVersions: [.v5]
)
