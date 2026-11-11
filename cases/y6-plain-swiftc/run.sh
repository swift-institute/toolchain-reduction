set -e
mkdir -p out
swiftc -parse-as-library -enable-experimental-feature Lifetimes -module-name Proto -emit-module -emit-module-path out/Proto.swiftmodule Sources/Proto/Proto.swift
swiftc -parse-as-library -enable-experimental-feature Lifetimes -module-name L -I out -emit-module -emit-module-path out/L.swiftmodule Sources/L/Shared.swift Sources/L/Shared+R.swift
swiftc -g -Onone -parse-as-library -enable-experimental-feature Lifetimes -Xfrontend -enable-round-trip-debug-types -module-name Probe -I out -c Sources/Probe/Probe.swift -o out/Probe.o
