// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CLLocationWrapper",
    platforms: [
        .iOS(.v15), .watchOS(.v8), .macOS(.v12), .tvOS(.v15),
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
