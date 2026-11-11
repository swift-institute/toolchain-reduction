public import L
public struct C<S: ~Copyable>: ~Copyable {
    @usableFromInline var s: S
}
extension C where S: ~Copyable, S: P & Q {
    @inlinable
    public subscript(i: Int) -> S.Element {
        _read { yield s[i] }
    }
}
