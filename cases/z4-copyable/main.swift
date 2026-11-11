import L

struct Col<E>: P, Q, R {
    var count: Tag<E> { Tag() }
    var r: Tag<E> { Tag() }
    subscript(slot: Tag<E>) -> E {
        get { fatalError() }
        set { fatalError() }
    }
}

func read<S: Q>(_ s: S) -> S.Element? { nil }

func probe(_ c: Col<Int>) {
    let s = Shared(c)
    let x = read(s)
    _ = x
}
