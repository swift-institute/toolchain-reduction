public import Ownership
public import Span

extension Ownership.Shared where Element: ~Copyable, B: ~Copyable {

    @inlinable
    package static func _window(
        of column: borrowing B
    ) -> (base: UnsafeRawPointer?, count: Int) where B: Span.`Protocol`, B.Element == Element {
        (nil, 0)
    }
}
