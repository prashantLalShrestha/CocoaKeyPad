// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaKeyPad",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "CocoaKeyPad",
            targets: ["CocoaKeyPad"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CocoaKeyPad",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "CocoaKeyPadTests",
            dependencies: ["CocoaKeyPad"],
            path: "CocoaKeyPadTests"),
    ]
)
