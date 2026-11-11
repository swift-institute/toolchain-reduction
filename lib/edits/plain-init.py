# Add a plain initializer from any column, so a probe can share a column of its own.
import sys
p = sys.argv[1] + "/Shared.swift"
s = open(p).read()
s += """
extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @inlinable
    public init(_ column: consuming B) {
        self.init(box: Ownership.Box(column, drain: { _ in }))
    }
}
"""
open(p, "w").write(s)
