public import Proto

extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        @usableFromInline var column: B
        public init(_ column: consuming B) { self.column = column }
    }
}

extension Ownership.Shared: R where B: R, B: ~Copyable {
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
