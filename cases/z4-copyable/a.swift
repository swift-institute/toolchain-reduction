public struct Tag<T> { public init() {} }

public protocol P {
    associatedtype Element
    subscript(slot: Tag<Element>) -> Element { get set }
}

public protocol Q {
    associatedtype Element
    var count: Tag<Element> { get }
}

public protocol R {
    associatedtype Element
    var r: Tag<Element> { get }
}

extension Shared: R where B: R {
    public var r: Tag<Element> { Tag() }
}
