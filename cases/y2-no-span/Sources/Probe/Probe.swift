import L
import Proto

public struct Col<E: ~Copyable>: ~Copyable, P, Q, R {
    public var capacity: Tag<E, Int> { Tag() }
    public var count: Tag<E, Int> { Tag() }
    public subscript(slot: Tag<E, Int>) -> E {
        _read { fatalError() }
        _modify { fatalError() }
    }
    public var span: Tag<E, Int> { Tag() }
}

func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

public func probe(_ c: consuming Col<Int>) {
    let s = Ownership.Shared(c)
    let x = read(s)
    _ = x
}
