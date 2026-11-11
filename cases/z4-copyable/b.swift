public struct Shared<Element, B: P & Q> where B.Element == Element {
    var column: B
    public init(_ column: B) { self.column = column }
}

extension Shared: P {
    public subscript(slot: Tag<Element>) -> Element {
        get { column[slot] }
        set { column[slot] = newValue }
    }
}

extension Shared: Q {
    public var count: Tag<Element> { Tag() }
}
