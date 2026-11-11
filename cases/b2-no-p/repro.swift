protocol Q { associatedtype Element }
protocol R { associatedtype Element }

extension Shared: R where B: R {}

struct Shared<Element, B: Q> where B.Element == Element {}

extension Shared: Q {}

struct Col<Element>: Q, R {}

func probe() {
    let x: Shared<Int, Col<Int>>.Element = 0
    _ = x
}
