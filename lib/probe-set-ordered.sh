# usage: bash ../../lib/probe-set-ordered.sh probe.swift
# Builds swift-set-ordered 9ecd341 with its test target replaced by probe.swift alone,
# with the debug-info round-trip check on.
set -e
probe="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
git clone -q https://github.com/swift-molecules/swift-set-ordered src
cd src && git checkout -q 9ecd341f212c78bf260c087f1b9d938578d636ec
rm -f Tests/"Set Ordered Tests"/*.swift
cp "$probe" Tests/"Set Ordered Tests"/Probe.swift
swift build -c debug --build-tests --enable-all-traits -Xswiftc -Xfrontend -Xswiftc -enable-round-trip-debug-types
