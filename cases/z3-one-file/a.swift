public struct Tag<T: ~Copyable> { public init() {} }

public protocol P: ~Copyable {
    associatedtype Element: ~Copyable
    subscript(slot: Tag<Element>) -> Element { get set }
}

public protocol Q: ~Copyable {
    associatedtype Element: ~Copyable
    var count: Tag<Element> { get }
}

public protocol R: ~Copyable {
    associatedtype Element: ~Copyable
    var r: Tag<Element> { get }
}

extension Shared: R where B: R, B: ~Copyable {
    public var r: Tag<Element> { Tag() }
}

public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
    var column: B
    public init(_ column: consuming B) { self.column = column }
}

extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public subscript(slot: Tag<Element>) -> Element {
        _read { yield column[slot] }
        _modify { yield &column[slot] }
    }
}

extension Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element> { Tag() }
}
