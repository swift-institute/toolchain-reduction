public import Proto

extension Ownership {
    public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
        @usableFromInline var column: B
        public init(_ column: consuming B) { self.column = column }
    }
}
