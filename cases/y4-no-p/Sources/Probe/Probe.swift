import L
import Proto

public struct Col<E: ~Copyable>: ~Copyable, Q, R {
    public var count: Tag<E, Int> { Tag() }
    public var span: Swift.Span<E> {
        @_lifetime(borrow self)
        borrowing get { fatalError() }
    }
}

func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

public func probe(_ c: consuming Col<Int>) {
    let s = Ownership.Shared(c)
    let x = read(s)
    _ = x
}
