set -e
mkdir -p out
swiftc -parse-as-library -module-name L -emit-module -emit-module-path out/L.swiftmodule lib.swift
swiftc -g -Onone -Xfrontend -enable-round-trip-debug-types -parse-as-library -module-name Main -I out -c main.swift -o out/main.o
