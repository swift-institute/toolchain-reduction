import L

struct Col<E>: Q, R {
    var q: Tag<E> { Tag() }
    var r: Tag<E> { Tag() }
}

func read<S: Q>(_ s: S) -> S.Element? { nil }

func probe(_ c: Col<Int>) {
    let x = read(Shared(c))
    _ = x
}
