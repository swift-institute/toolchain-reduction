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
