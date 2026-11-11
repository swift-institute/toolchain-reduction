public import ModA
public import ModS
extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
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
extension Ownership.Shared: Swift.Span.`Protocol` where B: Swift.Span.`Protocol`, B: ~Copyable {
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
public struct Col<Element: ~Copyable>: ~Copyable, P, Q, Swift.Span.`Protocol` {
    public init() {}
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
    public var capacity: Tag<Element, Int> { Tag() }
    public var count: Tag<Element, Int> { Tag() }
}
