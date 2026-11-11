protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<Element, B> {}
extension S: R where B == Int {}
extension S: Q {}
let x: S<Int, Int>.Element = 0
