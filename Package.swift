// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftNotificationCenter",
    platforms: [.iOS(.v8), .macOS(.v10_10)],
    products: [
        .library(
            name: "SwiftNotificationCenter",
            targets: ["SwiftNotificationCenter"]),
        .library(
            name: "SwiftNotificationCenterDynamic", 
            type: .dynamic, 
            targets: ["SwiftNotificationCenter"]
        )
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftNotificationCenter", dependencies: []),
        .testTarget(name: "SwiftNotificationCenterTests", dependencies: ["SwiftNotificationCenter"])
    ]
)
