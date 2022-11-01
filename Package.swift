// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "CLLocationWrapper",
    platforms: [
        .iOS(.v14), .watchOS(.v8), .macOS(.v12), .tvOS(.v14),
    ],
    products: [
        .library(name: "CLLocationWrapper", targets: ["CLLocationWrapper"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "CLLocationWrapper",
                dependencies: []),
        .testTarget(name: "CLLocationWrapperTests",
                    dependencies: ["CLLocationWrapper"]),
    ]
)
