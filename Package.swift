// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Base62",
    products: [
        .library(
            name: "Base62",
            targets: ["Base62"]),
    ],
    targets: [
        .target(
            name: "Base62",
            dependencies: []),
        .testTarget(
            name: "Base62Tests",
            dependencies: ["Base62"]),
    ]
)
