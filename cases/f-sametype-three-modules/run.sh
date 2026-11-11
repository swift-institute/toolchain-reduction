set -e
mkdir -p out
swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name L -emit-module -emit-module-path out/L.swiftmodule -c L.swift -o out/L.o
swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name M -I out -emit-module -emit-module-path out/M.swiftmodule -c M.swift -o out/M.o
swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name T -I out -c T.swift -o out/T.o
