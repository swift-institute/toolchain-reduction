import Buffer
import Cardinal
import Index
import Ownership
import Ownership_Shared_Primitive
import Span
import Store
import Tagged

public struct Col<E: ~Copyable>: ~Copyable, Store.`Protocol`, Buffer.`Protocol`, Span.`Protocol` {
    public var span: Swift::Span<E> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
    public var capacity: Tagged<E, Cardinal> { fatalError() }
    public var count: Tagged<E, Cardinal> { fatalError() }
    public subscript(slot: Index<E>) -> E {
        _read { fatalError() }
        _modify { fatalError() }
    }
    public mutating func initialize(at slot: Index<E>, to element: consuming E) { fatalError() }
    public mutating func move(at slot: Index<E>) -> E { fatalError() }
}

func read<S: Buffer.`Protocol` & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

public func probe(_ c: consuming Col<Int>) {
    let s = Ownership.Shared(c)
    let x = read(s)
    _ = x
}
