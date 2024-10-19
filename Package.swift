// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SplitViewKit",
    platforms: [
        .iOS(.v17), .macOS(.v14)
    ],
    products: [
        .library(
            name: "SplitViewKit",
            targets: ["SplitViewKit"]
        )
    ],
    dependencies: [
      // this wont be needed if we move example code to example project etc. do it later
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main")
    ],
    targets: [
        .target(
            name: "SplitViewKit",
            dependencies: [
               .product(name: "HybridColor", package: "HybridColor")
            ]
        ),
        .testTarget(
            name: "SplitViewKitTests",
            dependencies: ["SplitViewKit"]
        )
    ]
)
