protocol R { associatedtype Element }
struct S<Element> {}
extension S: R where Element == Int {}
extension S: R {}
let x: S<Int>.Element = 0
