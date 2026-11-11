public import Proto

extension Ownership.Shared: R where B: R, B: ~Copyable {
    public var span: Tag<Element, Int> { Tag() }
}
