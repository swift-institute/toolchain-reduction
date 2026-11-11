public struct Shared<Element: ~Copyable, B: P & Q & ~Copyable>: ~Copyable where B.Element == Element {
    var column: B
    public init(_ column: consuming B) { self.column = column }
}

extension Shared: P where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tag<Element> { Tag() }
}

extension Shared: Q where Element: ~Copyable, B: ~Copyable {
    public var count: Tag<Element> { Tag() }
}
