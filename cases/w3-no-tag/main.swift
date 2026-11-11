import L

struct Col<E>: P, Q, R {
    var p: E { fatalError() }
    var q: E { fatalError() }
    var r: E { fatalError() }
}

func read<S: Q>(_ s: S) -> S.Element? { nil }

func probe(_ c: Col<Int>) {
    let x = read(Shared(c))
    _ = x
}
