protocol Q { associatedtype Element }
protocol R { associatedtype Element }
extension Shared: R where B == Int {}
struct Shared<Element, B> {}
extension Shared: Q {}
let x: Shared<Int, Int>.Element = 0
