set -e
mkdir -p out
swiftc -g -Onone -Xfrontend -enable-round-trip-debug-types -parse-as-library -wmo -module-name M -c lib.swift main.swift -o out/m.o
