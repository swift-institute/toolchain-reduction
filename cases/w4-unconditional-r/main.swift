import L

struct Col<E>: P, Q, R {
    var p: Tag<E> { Tag() }
    var q: Tag<E> { Tag() }
    var r: Tag<E> { Tag() }
}

func read<S: Q>(_ s: S) -> S.Element? { nil }

func probe(_ c: Col<Int>) {
    let x = read(Shared(c))
    _ = x
}
