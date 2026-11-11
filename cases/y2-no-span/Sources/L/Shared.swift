public import Proto

extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        @usableFromInline var column: B
        public init(_ column: consuming B) { self.column = column }
    }
}

extension Ownership.Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tag<Element, Int> { Tag() }
    public subscript(slot: Tag<Element, Int>) -> Element {
        _read { yield column[slot] }
        _modify { yield &column[slot] }
    }
}

extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element, Int> { Tag() }
}
