set -e
mkdir -p out
swiftc -Onone -g -enable-testing -parse-as-library -enable-experimental-feature Lifetimes -module-name ModL -I out -emit-module -emit-module-path out/ModL.swiftmodule ModL.swift
swiftc -Onone -g -enable-testing -parse-as-library -enable-experimental-feature Lifetimes -Xfrontend -enable-round-trip-debug-types -module-name ModT -I out -c ModT.swift -o out/ModT.o
