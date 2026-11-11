protocol Q { associatedtype Element }
protocol R { associatedtype Element }
extension Shared: R where B: R {}
struct Shared<Element, B> {}
extension Shared: Q {}
struct Col: R { typealias Element = Int }
func probe() {
    let x: Shared<Int, Col>.Element = 0
}
