protocol Q { associatedtype Element }
protocol R { associatedtype Element }
extension Shared: R where B: R {}
struct Shared<Element, B> {}
extension Shared: Q {}
struct Col<Element>: R {}
func probe() {
    let x: Shared<Int, Col<Int>>.Element = 0
}
