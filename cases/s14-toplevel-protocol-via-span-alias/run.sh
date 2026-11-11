swiftc -Onone -g -parse-as-library -enable-experimental-feature Lifetimes -Xfrontend -enable-round-trip-debug-types -module-name M -c repro.swift -o /tmp/repro.o
