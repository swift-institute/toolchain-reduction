public enum __R {}
extension __R {
    public protocol `Protocol`: ~Copyable, ~Escapable {
        associatedtype Element: ~Copyable
        var span: Swift.Span<Element> { @_lifetime(borrow self) get }
    }
}
extension Swift.Span {
    public typealias `Protocol` = __R.`Protocol`
}
extension Swift.Span: __R.`Protocol` {
    public var span: Swift.Span<Element> {
        @_lifetime(borrow self) get { self }
    }
}
