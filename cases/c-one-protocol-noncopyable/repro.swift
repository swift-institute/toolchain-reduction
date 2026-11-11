public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    subscript(i: Int) -> Element { get }
}
public struct Shared<Element: ~Copyable, B: ~Copyable>: ~Copyable {}
extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public subscript(i: Int) -> Element { fatalError() }
}
public struct C<S: ~Copyable>: ~Copyable { var s: S }
extension C where S: P & ~Copyable {
    public subscript(i: Int) -> S.Element {
        _read { yield s[i] }
    }
}
public func f(_ c: borrowing C<Shared<Int, Int>>) {
    let x = c[0]
    _ = x
}
