protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<Element> {}
extension S: Q {}
extension S: R where Element == Int {}
let x: S<Int>.Element = 0
