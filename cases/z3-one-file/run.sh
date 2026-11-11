set -e
mkdir -p out
swiftc -parse-as-library -module-name L -emit-module -emit-module-path out/L.swiftmodule a.swift
swiftc -g -Onone -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name Probe -I out -c main.swift -o out/main.o
