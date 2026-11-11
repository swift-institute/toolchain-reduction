// swift-tools-version: 6.2
import PackageDescription
let package = Package(
    name: "X",
    targets: [
        .target(name: "L"),
        .target(name: "Probe", dependencies: ["L"]),
    ]
)
for target in package.targets {
    target.swiftSettings = [.enableExperimentalFeature("Lifetimes")]
}
