public import ModN
public protocol Q: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}
