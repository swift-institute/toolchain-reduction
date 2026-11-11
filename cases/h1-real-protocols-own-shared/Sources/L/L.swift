public import Buffer
public import Cardinal
public import Index
public import Ownership
public import Store
public import Tagged

extension Ownership {
    public struct Shared<Element: ~Copyable, B: Store.`Protocol` & Buffer.`Protocol` & ~Copyable>: ~Copyable
    where B.Element == Element {
        public var b: B
        public init(_ b: consuming B) { self.b = b }
    }
}

extension Ownership.Shared: Store.`Protocol` where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tagged<Element, Cardinal> { b.capacity }
    public subscript(slot: Index<Element>) -> Element {
        _read { yield b[slot] }
        _modify { yield &b[slot] }
    }
    public mutating func initialize(at slot: Index<Element>, to element: consuming Element) {
        b.initialize(at: slot, to: element)
    }
    public mutating func move(at slot: Index<Element>) -> Element { b.move(at: slot) }
    public mutating func swapAt(_ i: Index<Element>, _ j: Index<Element>) { b.swapAt(i, j) }
    public mutating func unshare() {}
}

extension Ownership.Shared: Buffer.`Protocol` where Element: ~Copyable, B: ~Copyable {
    public var count: Tagged<Element, Cardinal> { b.count }
}

public struct Col<E: ~Copyable>: ~Copyable, Store.`Protocol`, Buffer.`Protocol` {
    public init() {}
    public var capacity: Tagged<E, Cardinal> { fatalError() }
    public var count: Tagged<E, Cardinal> { fatalError() }
    public subscript(slot: Index<E>) -> E {
        _read { fatalError() }
        _modify { fatalError() }
    }
    public mutating func initialize(at slot: Index<E>, to element: consuming E) { fatalError() }
    public mutating func move(at slot: Index<E>) -> E { fatalError() }
}
