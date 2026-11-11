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
