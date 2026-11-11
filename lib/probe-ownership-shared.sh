# usage: bash ../../lib/probe-ownership-shared.sh [file to delete from the module ...]
# Builds swift-ownership-shared 23776f7 plus one target, Probe, holding probe p8,
# with the debug-info round-trip check on. Each argument names a source file of
# "Ownership Shared Primitive" to delete first.
set -e
here="$(pwd)"
git clone -q https://github.com/swift-molecules/swift-ownership-shared src
cd src && git checkout -q 23776f72ab20ec9a82f2a28e32fbd70cae475f57
for f in "$@"; do rm -v "Sources/Ownership Shared Primitive/$f"; done
mkdir -p Sources/Probe && cp "$here/../../lib/probe-p8.swift" Sources/Probe/Probe.swift
cat >> Package.swift <<'MANIFEST'

package.targets.append(
    .target(
        name: "Probe",
        dependencies: [
            .target(name: "Ownership Shared Primitive"),
            .product(name: "Buffer", package: "swift-buffer"),
            .product(name: "Buffer Linear Primitive", package: "swift-buffer-linear"),
            .product(name: "Storage", package: "swift-storage"),
            .product(name: "Memory", package: "swift-memory"),
            .product(name: "Memory Allocator", package: "swift-memory-allocation"),
            .product(name: "Index", package: "swift-index"),
            .product(name: "Tagged", package: "swift-tagged"),
            .product(name: "Ownership", package: "swift-ownership"),
        ]
    )
)
MANIFEST
swift build -c debug --target Probe -Xswiftc -Xfrontend -Xswiftc -enable-round-trip-debug-types
