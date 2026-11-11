public import ModN
public import ModP
public import ModQ
extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}
extension Ownership.Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tag<Element, Int> { Tag() }
}
extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element, Int> { Tag() }
}
public struct Col<Element: ~Copyable>: ~Copyable, P, Q {
    public init() {}
    public var capacity: Tag<Element, Int> { Tag() }
    public var count: Tag<Element, Int> { Tag() }
}
