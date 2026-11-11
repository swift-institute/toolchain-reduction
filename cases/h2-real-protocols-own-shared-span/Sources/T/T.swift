public import Buffer
public import L
public import Ownership

func read<S: Buffer.`Protocol` & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

public func probe() {
    let s = Ownership.Shared(Col<Int>())
    let x = read(s)
    _ = x
}
