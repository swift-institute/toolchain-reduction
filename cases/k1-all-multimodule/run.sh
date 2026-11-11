set -e
mkdir -p out
swiftc -parse-as-library -module-name ModN -I out -emit-module -emit-module-path out/ModN.swiftmodule N.swift
swiftc -parse-as-library -module-name ModP -I out -emit-module -emit-module-path out/ModP.swiftmodule P.swift
swiftc -parse-as-library -module-name ModQ -I out -emit-module -emit-module-path out/ModQ.swiftmodule Q.swift
swiftc -parse-as-library -module-name ModL -I out -emit-module -emit-module-path out/ModL.swiftmodule L.swift
swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name ModT -I out -c T.swift -o out/T.o
echo "--- Element names in the debug info of T.o:"; strings -a out/T.o | grep -E "^\\$s.*Element" | sort -u | while read m; do echo "$m"; swift demangle "$m"; done
