import Buffer
import Buffer_Linear_Primitive
import Hash_Indexed_Primitive
import Hash_Table_Primitive
import Index
import Memory
import Memory_Allocator
import Ordinal
import Ownership_Shared_Primitive
import Set_Ordered
import Set_Primitive
import Storage
import Store
import Tagged

typealias HeapStorage<E: ~Copyable> = Storage<Memory.Allocator<Memory.Heap>>.Contiguous<E>
typealias OrderedColumn<E: Swift::Hashable & ~Copyable> = Hash.Indexed<Buffer<HeapStorage<E>>.Linear>
typealias LinearColumn<E: ~Copyable> = Buffer<HeapStorage<E>>.Linear

func read<S: Buffer.`Protocol` & ~Copyable>(_ s: borrowing S) -> Index<S.Element>.Count {
    s.count
}
func probe() {
    let s = Ownership.Shared(LinearColumn<Int>(minimumCapacity: Index<Int>.Count(4)))
    let n = read(s)
    _ = n
}
