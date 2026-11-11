public protocol P {
    associatedtype Element
    subscript(i: Int) -> Element { get }
}
public protocol Q {
    associatedtype Element
    var first: Element? { get }
}
public struct Shared<Element, B> {}
extension Shared: P {
    public subscript(i: Int) -> Element { fatalError() }
}
extension Shared: Q {
    public var first: Element? { nil }
}
public struct C<S> { var s: S }
extension C where S: P & Q {
    public subscript(i: Int) -> S.Element { s[i] }
}
public func f(_ c: C<Shared<Int, Int>>) {
    let x = c[0]
    _ = x
}
