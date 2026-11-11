public struct Tag<T> { public init() {} }

public protocol Q { associatedtype Element; var q: Tag<Element> { get } }
public protocol R { associatedtype Element; var r: Tag<Element> { get } }

extension Shared: R where B: R { public var r: Tag<Element> { Tag() } }

public struct Shared<Element, B: Q> where B.Element == Element {
    public init(_ b: B) {}
}

extension Shared: Q { public var q: Tag<Element> { Tag() } }
