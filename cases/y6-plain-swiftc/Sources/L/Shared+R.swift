public import Proto

extension Ownership.Shared: R where B: R, B: ~Copyable {
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
