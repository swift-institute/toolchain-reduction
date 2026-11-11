public import ModN
public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    var capacity: Tag<Element, Int> { get }
}
