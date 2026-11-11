public import ModN
public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}
