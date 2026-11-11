public import Buffer
import Buffer_Linear_Primitive
import Index
public import L
import Memory
import Memory_Allocator
public import Ownership
import Storage
import Tagged

typealias LinearColumn<E: ~Copyable> = Buffer<Storage<Memory.Allocator<Memory.Heap>>.Contiguous<E>>.Linear

func read<S: Buffer.`Protocol` & ~Copyable>(_ s: borrowing S) -> S.Element? { nil }

public func probe() {
    let s = Ownership.Shared(LinearColumn<Int>(minimumCapacity: Index<Int>.Count(4)))
    let x = read(s)
    _ = x
}
