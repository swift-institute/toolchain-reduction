public enum Ownership {}
public struct Tag<T: ~Copyable, U> { public init() {} }
public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    var capacity: Tag<Element, Int> { get }
}
public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var count: Tag<Element, Int> { get }
}
public protocol R: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var span: Tag<Element, Int> { get }
}
extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}
extension Ownership.Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tag<Element, Int> { Tag() }
}
extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element, Int> { Tag() }
}
extension Ownership.Shared: R where B: R, B: ~Copyable {
    public var span: Tag<Element, Int> { Tag() }
}
public struct Col<Element: ~Copyable>: ~Copyable, P, Q, R {
    public init() {}
    public var span: Tag<Element, Int> { Tag() }
    public var capacity: Tag<Element, Int> { Tag() }
    public var count: Tag<Element, Int> { Tag() }
}
func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }
public func probe() {
    let s = Ownership.Shared(Col<Int>())
    let x = read(s)
    _ = x
}
