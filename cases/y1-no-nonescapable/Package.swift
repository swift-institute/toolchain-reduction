// swift-tools-version: 6.2
import PackageDescription
let package = Package(
    name: "X",
    targets: [
        .target(name: "Proto"),
        .target(name: "L", dependencies: ["Proto"]),
        .target(name: "Probe", dependencies: ["Proto", "L"]),
    ]
)
for target in package.targets {
    target.swiftSettings = [.enableExperimentalFeature("Lifetimes")]
}
