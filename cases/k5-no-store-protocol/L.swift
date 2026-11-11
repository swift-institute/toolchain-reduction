public import ModN
public import ModQ
extension Ownership {
    public struct Shared<Element: ~Copyable, B: Q & ~Copyable>: ~Copyable where B.Element == Element {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}
extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element, Int> { Tag() }
}
public struct Col<Element: ~Copyable>: ~Copyable, Q {
    public init() {}
    public var count: Tag<Element, Int> { Tag() }
}
