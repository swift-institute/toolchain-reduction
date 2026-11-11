protocol P { associatedtype Element }
protocol R { associatedtype Element }

extension Shared: R where B: R {}

struct Shared<Element, B: P> where B.Element == Element {}

extension Shared: P {}

struct Col<Element>: P, R {}

func probe() {
    let x: Shared<Int, Col<Int>>.Element = 0
    _ = x
}
