public import Buffer
public import Cardinal
public import Index
public import Ownership
public import Store
public import Tagged

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
