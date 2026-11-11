protocol R { associatedtype Element }
struct S<Element> {}
extension S: R where Element == Int {}
let x: S<Int>.Element = 0
