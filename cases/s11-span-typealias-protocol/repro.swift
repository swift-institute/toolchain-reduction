public enum Ownership {}
public struct Tag<T: ~Copyable, U> { public init() {} }
public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    var capacity: Tag<Element, Int> { get }
}
public protocol Q: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}
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
func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }
public func probe() {
    let s = Ownership.Shared(Col<Int>())
    let x = read(s)
    _ = x
}
