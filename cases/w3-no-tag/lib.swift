public protocol P { associatedtype Element; var p: Element { get } }
public protocol Q { associatedtype Element; var q: Element { get } }
public protocol R { associatedtype Element; var r: Element { get } }

extension Shared: R where B: R { public var r: Element { fatalError() } }

public struct Shared<Element, B: P & Q> where B.Element == Element {
    public init(_ b: B) {}
}

extension Shared: P { public var p: Element { fatalError() } }
extension Shared: Q { public var q: Element { fatalError() } }
