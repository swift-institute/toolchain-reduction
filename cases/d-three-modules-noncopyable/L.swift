public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    subscript(i: Int) -> Element { get }
}
public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var first: Element? { get }
}
public struct Shared<Element: ~Copyable, B: ~Copyable>: ~Copyable {}
extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public subscript(i: Int) -> Element { fatalError() }
}
extension Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var first: Element? { nil }
}
