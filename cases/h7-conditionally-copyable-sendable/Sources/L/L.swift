public import Buffer
public import Buffer_Linear_Primitive
public import Memory
public import Memory_Allocator
public import Memory_Allocator_Protocol
public import Storage
public import Cardinal
public import Index
public import Ownership
public import Span
public import Store
public import Tagged

extension Ownership {
    public final class SharedBox<B: ~Copyable> {
        public var value: B
        @usableFromInline init(_ value: consuming B) { self.value = value }
    }

    public struct Shared<Element: ~Copyable, B: Store.`Protocol` & Buffer.`Protocol` & ~Copyable>: ~Copyable
    where B.Element == Element {
        @usableFromInline var box: Ownership.SharedBox<B>
        @usableFromInline init(b: consuming B) { self.box = Ownership.SharedBox(b) }
    }
}

extension Ownership.Shared: Copyable where Element: Copyable, B: ~Copyable {}

extension Ownership.Shared: @unchecked Sendable where Element: ~Copyable, B: Sendable & ~Copyable {}

extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @inlinable
    public init<Resource: Memory.Growable & SendableMetatype & ~Copyable>(
        _ buffer: consuming Buffer<Storage<Memory.Allocator<Resource>>.Contiguous<Element>>.Linear
    )
    where B == Buffer<Storage<Memory.Allocator<Resource>>.Contiguous<Element>>.Linear {
        self.init(b: buffer)
    }
}

extension Ownership.Shared where Element: Copyable, B: ~Copyable {
    @inlinable
    public init<Resource: Memory.Growable & SendableMetatype & ~Copyable>(
        _ buffer: consuming Buffer<Storage<Memory.Allocator<Resource>>.Contiguous<Element>>.Linear
    )
    where B == Buffer<Storage<Memory.Allocator<Resource>>.Contiguous<Element>>.Linear {
        self.init(b: buffer)
    }
}

extension Ownership.Shared: Store.`Protocol` where Element: ~Copyable, B: ~Copyable {
    public var capacity: Tagged<Element, Cardinal> { box.value.capacity }
    public subscript(slot: Index<Element>) -> Element {
        _read { yield box.value[slot] }
        _modify { yield &box.value[slot] }
    }
    public mutating func initialize(at slot: Index<Element>, to element: consuming Element) {
        box.value.initialize(at: slot, to: element)
    }
    public mutating func move(at slot: Index<Element>) -> Element { box.value.move(at: slot) }
    public mutating func swapAt(_ i: Index<Element>, _ j: Index<Element>) { box.value.swapAt(i, j) }
    public mutating func unshare() {}
}

extension Ownership.Shared: Buffer.`Protocol` where Element: ~Copyable, B: ~Copyable {
    public var count: Tagged<Element, Cardinal> { box.value.count }
}

extension Ownership.Shared: Span.`Protocol` where B: Span.`Protocol`, B: ~Copyable {
    public var span: Swift::Span<Element> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}

public struct Col<E: ~Copyable>: ~Copyable, Store.`Protocol`, Buffer.`Protocol`, Span.`Protocol` {
    public var span: Swift::Span<E> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
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
