# Space war game!

# Stores the coordinates of a game piece.
mutable struct Position # mutable because we expect the pieces to move around
    x::Int
    y::Int
end

# Stores the size of a game piece
struct Size
    width::Int 
    height::Int
end

# Holds a single game piece
struct Widget
    name::String
    position::Position
    size::Size
end

# single-line functions to coordinate moving of the game pieces
move_up!(widget::Widget, to_move::Int) = widget.position.y -= to_move
move_down!(widget::Widget, to_move::Int) = widget.position.y += to_move
move_left!(widget::Widget, to_move::Int) = widget.position.x -= to_move
move_right!(widget::Widget, to_move::Int) = widget.position.x += to_move

# Define pretty print functions
Base.show(io::IO, p::Position) = print(io, "(", p.x, ",", p.y, ")")
Base.show(io::IO, s::Size) = print(io, s.width, " x ", s.height)
Base.show(io::IO, w::Widget) = print(io, w.name, " at ", w.position, " size ", w.size)

function make_asteroids(N::Int, pos_range=0:200, size_range=10:30)
    pos_rand() = rand(pos_range)
    sz_rand() = rand(size_range)
    return [Widget("Asteroid #$i", Position(pos_rand(), pos_rand()), Size(sz_rand(), sz_rand())) for i in 1:N]
end

function main()
    w = Widget("asteroid", Position(0, 0), Size(10, 20))
    move_up!(w, 10)
    move_down!(w, 10)
    move_left!(w, 20)
    move_right!(w, 20)
    
    # it should be back to Position(0, 0)
    print(w)
end


main()