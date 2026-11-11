public enum Ownership {}
public struct Tag<T: ~Copyable, U> { public init() {} }

public protocol Q: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}

public protocol R: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var span: Swift.Span<Element> { @_lifetime(borrow self) get }
}
