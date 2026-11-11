public import L
public struct C<S: ~Copyable>: ~Copyable {
    @usableFromInline var s: S
}
extension C where S: P & Q & ~Copyable {
    public subscript(i: Int) -> S.Element { s[i] }
}
