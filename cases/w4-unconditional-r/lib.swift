public struct Tag<T> { public init() {} }

public protocol P { associatedtype Element; var p: Tag<Element> { get } }
public protocol Q { associatedtype Element; var q: Tag<Element> { get } }
public protocol R { associatedtype Element; var r: Tag<Element> { get } }

extension Shared: R { public var r: Tag<Element> { Tag() } }

public struct Shared<Element, B: P & Q> where B.Element == Element {
    public init(_ b: B) {}
}

extension Shared: P { public var p: Tag<Element> { Tag() } }
extension Shared: Q { public var q: Tag<Element> { Tag() } }
