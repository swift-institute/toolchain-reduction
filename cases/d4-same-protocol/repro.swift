protocol Q { associatedtype Element }
extension Shared: Q where B: Q {}
struct Shared<Element, B> {}
struct Col<Element>: Q {}
func probe() {
    let x: Shared<Int, Col<Int>>.Element = 0
}
