using Test

module Foo
    foo(x, y) = 1
    foo(s::Integer, y) = 2
    foo(s, y::Integer) = 3
    foo(x::Integer, y::Integer) = 4
end


module Foo2
    foo(x, y) = 1
    foo(x::Integer, y) = 2
    foo(s, y::Integer) = 3
end

module Foo4
    import Main.Foo2
    Foo2.foo(x::Integer, y::Integer) = 4
end