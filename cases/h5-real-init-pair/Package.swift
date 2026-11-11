// swift-tools-version: 6.4
import PackageDescription
let package = Package(
    name: "h5",
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-store.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-buffer.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-index.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-cardinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ownership.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-span.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-buffer-linear.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-storage.git", branch: "main", traits: ["Memory"]),
        .package(url: "https://github.com/swift-atoms/swift-memory.git", branch: "main"),
        .package(url: "https://github.com/swift-molecules/swift-memory-allocation.git", branch: "main"),
    ],
    targets: [
        .target(name: "L", dependencies: [
            .product(name: "Store", package: "swift-store"),
            .product(name: "Buffer", package: "swift-buffer"),
            .product(name: "Index", package: "swift-index"),
            .product(name: "Tagged", package: "swift-tagged"),
            .product(name: "Cardinal", package: "swift-cardinal"),
            .product(name: "Ownership", package: "swift-ownership"),
            .product(name: "Span", package: "swift-span"),
            .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear"),
            .product(name: "Storage", package: "swift-storage"),
            .product(name: "Memory", package: "swift-memory"),
            .product(name: "Memory Allocator", package: "swift-memory-allocation"),
            .product(name: "Memory Allocator Protocol", package: "swift-memory-allocation"),
        ]),
        .target(name: "T", dependencies: [
            "L",
            .product(name: "Buffer", package: "swift-buffer"),
            .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear"),
            .product(name: "Storage", package: "swift-storage"),
            .product(name: "Memory", package: "swift-memory"),
            .product(name: "Memory Allocator", package: "swift-memory-allocation"),
            .product(name: "Index", package: "swift-index"),
            .product(name: "Tagged", package: "swift-tagged"),
            .product(name: "Ownership", package: "swift-ownership"),
        ]),
    ],
    swiftLanguageModes: [.v6]
)
for target in package.targets {
    target.swiftSettings = [.enableExperimentalFeature("Lifetimes")]
}
