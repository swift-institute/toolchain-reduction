public import Proto

extension Shared: R where B: R, B: ~Copyable {
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
