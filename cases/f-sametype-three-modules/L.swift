public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    subscript(i: Int) -> Element { get }
}
public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var count: Int { get }
}
public struct Column<Element: ~Copyable>: ~Copyable, P, Q {
    public subscript(i: Int) -> Element { fatalError() }
    public var count: Int { 0 }
}
public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
    @usableFromInline var b: B
}
extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public subscript(i: Int) -> Element {
        _read { yield b[i] }
    }
}
extension Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Int { b.count }
}
