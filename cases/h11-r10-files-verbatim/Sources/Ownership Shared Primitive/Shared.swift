public import Buffer
import Cardinal
import Index
public import Ownership
public import Store
import Tagged

extension Ownership {

    @frozen
    public struct Shared<
        Element: ~Copyable,
        B: Store.`Protocol` & Buffer.`Protocol` & ~Copyable
    >: ~Copyable where B.Element == Element {

        @usableFromInline
        internal var box: Ownership.Box<B>

        @usableFromInline
        internal init(box: consuming Ownership.Box<B>) {
            self.box = box
        }
    }
}


extension Ownership.Shared: Copyable where Element: Copyable, B: ~Copyable {}


extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {
    @inlinable
    public init(_ column: consuming B) {
        self.init(box: Ownership.Box(column, drain: { _ in }))
    }
}
