// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SampleKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SampleKit",
            targets: ["SampleKit"]),
    ],
    dependencies: [
//        .package(
//            url: "https://github.com/Alamofire/Alamofire.git",
//            from: "5.6.1")
    ],
    targets: [
        .target(
            name: "SampleKit",
            dependencies: [],
            path: "Sources",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "SampleKitTests",
            dependencies: ["SampleKit"],
            path: "Tests"
        ),
    ]
)
