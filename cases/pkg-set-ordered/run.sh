set -e
git clone -q https://github.com/swift-molecules/swift-set-ordered src
cd src && git checkout -q 9ecd341f212c78bf260c087f1b9d938578d636ec
swift build -c debug --build-tests --enable-all-traits -Xswiftc -Xfrontend -Xswiftc -enable-round-trip-debug-types
