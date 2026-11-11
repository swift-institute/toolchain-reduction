protocol Q { associatedtype Element }
protocol R {}
extension Shared: R where B: R {}
struct Shared<Element, B> {}
extension Shared: Q {}
struct Col: R {}
func probe() {
    let x: Shared<Int, Col>.Element = 0
}
