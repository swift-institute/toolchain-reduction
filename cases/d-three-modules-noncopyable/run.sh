set -e
mkdir -p out
swiftc -parse-as-library -module-name L -emit-module -emit-module-path out/L.swiftmodule L.swift
swiftc -parse-as-library -module-name M -I out -emit-module -emit-module-path out/M.swiftmodule M.swift
swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name T -I out -c T.swift -o out/T.o
