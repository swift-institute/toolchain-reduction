protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<T> {}
extension S: R where T == Int { typealias Element = T }
extension S: Q {}
let x: S<Int>.Element = 0
