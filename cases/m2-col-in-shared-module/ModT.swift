public import ModA
public import ModL
func read<S: Q & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }
public func probe() {
    let s = Ownership.Shared(Col<Int>())
    let x = read(s)
    _ = x
}
