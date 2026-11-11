protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<Element> {}
extension S: R where Element == Int {}
extension S: Q {}
func f(_ x: S<Int>.Element) {}
