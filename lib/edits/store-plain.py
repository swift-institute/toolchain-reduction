# Store/Buffer conformances: witnesses that read the box directly, no ensureUnique, no unshare.
import sys
p = sys.argv[1] + "/Ownership.Shared+Store.Protocol.swift"
s = open(p).read()
s = s.replace("            ensureUnique()\n", "").replace("        ensureUnique()\n", "")
s = s.replace("""    @inlinable
    public mutating func unshare() {
    }
""", "")
open(p, "w").write(s)
