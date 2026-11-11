public enum Ownership {}
public struct Tag<T: ~Copyable, U> { public init() {} }

public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    var capacity: Tag<Element, Int> { get }
    subscript(slot: Tag<Element, Int>) -> Element { get set }
}

public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}

public protocol R: ~Copyable {
    associatedtype Element: ~Copyable
    var span: Swift.Span<Element> { @_lifetime(borrow self) get }
}
