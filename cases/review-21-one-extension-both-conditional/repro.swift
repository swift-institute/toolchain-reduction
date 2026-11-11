protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<Element> {}
extension S: R, Q where Element == Int {}
let x: S<Int>.Element = 0
