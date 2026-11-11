set -e
mkdir -p out
swiftc -g -Onone -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name M -c a.swift b.swift main.swift -o out/x.o 2>&1 || swiftc -g -Onone -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name M -c a.swift b.swift main.swift
