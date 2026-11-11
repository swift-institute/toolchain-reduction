protocol Q { associatedtype Element }
protocol R { associatedtype Element }
extension S: R where Element == Int {}
struct S<Element> {}
extension S: Q {}
let x: S<Int>.Element = 0
