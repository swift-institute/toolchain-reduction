protocol P { associatedtype Element; var p: Element { get } }
protocol Q { associatedtype Element; var q: Element { get } }
protocol R { associatedtype Element; var r: Element { get } }

extension Shared: R where B: R { var r: Element { fatalError() } }

struct Shared<Element, B: P & Q> where B.Element == Element {
    init(_ b: B) {}
}

extension Shared: P { var p: Element { fatalError() } }
extension Shared: Q { var q: Element { fatalError() } }

struct Col<E>: P, Q, R {
    var p: E { fatalError() }
    var q: E { fatalError() }
    var r: E { fatalError() }
}

func read<S: Q>(_ s: S) -> S.Element { fatalError() }

func probe(_ c: Col<Int>) {
    let x = read(Shared(c))
    _ = x
}
