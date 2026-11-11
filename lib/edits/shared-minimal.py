# Shared.swift: drop _boxID and the Sendable conformance; keep the struct and Copyable.
import sys
p = sys.argv[1] + "/Shared.swift"
s = open(p).read()
s = s.replace("""extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @usableFromInline
    package var _boxID: ObjectIdentifier { box.identity }
}
""", "")
s = s.replace("extension Ownership.Shared: Sendable where Element: ~Copyable, B: Sendable & ~Copyable {}\n", "")
assert "_boxID" not in s and "Sendable where" not in s
open(p, "w").write(s)
