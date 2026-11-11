public enum Ownership {}
public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    var capacity: Int { get }
}
public protocol Q: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var count: Int { get }
}
public protocol R: ~Copyable, ~Escapable {
    associatedtype Element: ~Copyable
    var span: Int { get }
}
extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}
extension Ownership.Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Int { 0 }
}
extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Int { 0 }
}
extension Ownership.Shared: R where B: R, B: ~Copyable {
    public var span: Int { 0 }
}
public struct Col<Element: ~Copyable>: ~Copyable, P, Q, R {
    public init() {}
    public var span: Int { 0 }
    public var capacity: Int { 0 }
    public var count: Int { 0 }
}
func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }
public func probe() {
    let s = Ownership.Shared(Col<Int>())
    let x = read(s)
    _ = x
}
