public import Proto

extension Ownership {
    public struct Shared<Element: ~Copyable, B: Q & ~Copyable>: ~Copyable where B.Element == Element {
        @usableFromInline var column: B
        public init(_ column: consuming B) { self.column = column }
    }
}

extension Ownership.Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element, Int> { Tag() }
}
