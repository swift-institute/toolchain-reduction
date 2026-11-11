public import Ownership
public import Span

extension Ownership.Shared: Span.`Protocol` where B: Span.`Protocol`, B: ~Copyable {

    @inlinable
    public var span: Swift::Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
