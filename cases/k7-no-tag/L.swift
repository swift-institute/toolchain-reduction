public import ModN
public import ModP
public import ModQ
extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}
extension Ownership.Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Int { 0 }
}
extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Int { 0 }
}
public struct Col<Element: ~Copyable>: ~Copyable, P, Q {
    public init() {}
    public var capacity: Int { 0 }
    public var count: Int { 0 }
}
