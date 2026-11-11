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
