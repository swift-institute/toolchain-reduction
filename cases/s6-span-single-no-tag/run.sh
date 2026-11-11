swiftc -Onone -g -parse-as-library -Xfrontend -enable-round-trip-debug-types -module-name M -c repro.swift -o /tmp/repro.o
