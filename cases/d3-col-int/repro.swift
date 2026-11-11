protocol Q { associatedtype Element }
protocol R { associatedtype Element }
extension Shared: R where B: R {}
extension Int: R { typealias Element = Int }
struct Shared<Element, B> {}
extension Shared: Q {}
func probe() {
    let x: Shared<Int, Int>.Element = 0
}
