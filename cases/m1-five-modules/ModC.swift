public import ModA
public import ModS
public struct Col<Element: ~Copyable>: ~Copyable, P, Q, Swift.Span.`Protocol` {
    public init() {}
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
    public var capacity: Tag<Element, Int> { Tag() }
    public var count: Tag<Element, Int> { Tag() }
}
