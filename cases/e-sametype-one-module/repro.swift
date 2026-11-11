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
    var b: B
}
extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public subscript(i: Int) -> Element { b[i] }
}
extension Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Int { b.count }
}
public struct C<S: ~Copyable>: ~Copyable {
    @usableFromInline var s: S
}
extension C where S: ~Copyable, S: P & Q {
    @inlinable
    public subscript(i: Int) -> S.Element {
        _read { yield s[i] }
    }
}
public func f(_ c: borrowing C<Shared<Int, Column<Int>>>) {
    let x = c[0]
    _ = x
}
