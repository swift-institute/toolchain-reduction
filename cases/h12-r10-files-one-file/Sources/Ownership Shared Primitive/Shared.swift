public import Buffer
public import Cardinal
public import Index
public import Ownership
public import Store
public import Tagged
public import Span

extension Ownership {

    @frozen
    public struct Shared<
        Element: ~Copyable,
        B: Store.`Protocol` & Buffer.`Protocol` & ~Copyable
    >: ~Copyable where B.Element == Element {

        @usableFromInline
        internal var box: Ownership.Box<B>

        @usableFromInline
        internal init(box: consuming Ownership.Box<B>) {
            self.box = box
        }
    }
}


extension Ownership.Shared: Copyable where Element: Copyable, B: ~Copyable {}


extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @inlinable
    public init(_ column: consuming B) {
        self.init(box: Ownership.Box(column, drain: { _ in }))
    }
}

extension Ownership.Shared: Store.`Protocol` where Element: ~Copyable, B: ~Copyable {

    @inlinable
    public var capacity: Tagged<Element, Cardinal> { unsafe box.unguarded.capacity }

    @inlinable
    public subscript(slot: Index<Element>) -> Element {
        _read { yield unsafe box.unguarded[slot] }
        _modify {
            yield unsafe &box.unguarded[slot]
        }
    }

    @inlinable
    public mutating func initialize(at slot: Index<Element>, to element: consuming Element) {
        unsafe box.unguarded.initialize(at: slot, to: element)
    }

    @inlinable
    public mutating func move(at slot: Index<Element>) -> Element {
        return unsafe box.unguarded.move(at: slot)
    }

    @inlinable
    public mutating func swapAt(_ i: Index<Element>, _ j: Index<Element>) {
        unsafe box.unguarded.swapAt(i, j)
    }

}

extension Ownership.Shared: Buffer.`Protocol` where Element: ~Copyable, B: ~Copyable {

    @inlinable
    public var count: Tagged<Element, Cardinal> { unsafe box.unguarded.count }
}

extension Ownership.Shared: Span.`Protocol` where B: Span.`Protocol`, B: ~Copyable {

    @inlinable
    public var span: Swift::Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}
