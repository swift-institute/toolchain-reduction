import L

struct Col<E: ~Copyable>: ~Copyable, P, Q, R {
    var count: Tag<E> { Tag() }
    var r: Tag<E> { Tag() }
    var capacity: Tag<E> { Tag() }
}

func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

func probe(_ c: consuming Col<Int>) {
    let s = Shared(c)
    let x = read(s)
    _ = x
}
