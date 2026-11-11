public import ModN
public protocol Q: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var count: Int { get }
}
