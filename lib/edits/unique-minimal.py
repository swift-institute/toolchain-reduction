# Keep only the two linear-buffer initializers and ensureUnique in Shared+Unique.swift.
import sys, re
p = sys.argv[1] + "/Shared+Unique.swift"
s = open(p).read()
head = s[:s.index("extension Ownership.Shared")]
inits = re.findall(r"extension Ownership\.Shared where Element: (?:~Copyable|Copyable), B: ~Copyable \{\n\n    /// Shares.*?\n\}\n", s, re.S)
assert len(inits) == 2, len(inits)
ensure = """extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @inlinable
    @discardableResult
    public mutating func ensureUnique() -> Bool {
        box.ensureUnique()
    }
}
"""
open(p, "w").write(head + "\n".join(inits) + "\n" + ensure)
