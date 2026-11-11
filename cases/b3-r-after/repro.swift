protocol P { associatedtype Element }
protocol Q { associatedtype Element }
protocol R { associatedtype Element }

struct Shared<Element, B: P & Q> where B.Element == Element {}

extension Shared: P {}
extension Shared: Q {}

extension Shared: R where B: R {}

struct Col<Element>: P, Q, R {}

func probe() {
    let x: Shared<Int, Col<Int>>.Element = 0
    _ = x
}
