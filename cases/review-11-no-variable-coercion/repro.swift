protocol Q { associatedtype Element }
protocol R { associatedtype Element }
struct S<Element> {}
extension S: R where Element == Int {}
extension S: Q {}
print(0 as S<Int>.Element)
