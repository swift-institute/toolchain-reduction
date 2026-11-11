public import ModN
public protocol R: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var span: Tag<Element, Int> { get }
}
