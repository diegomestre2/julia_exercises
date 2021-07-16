# Space war game!
# A thing is anything that exist in the universe.
# Concrete type of Thing should always have the following fields:
#       1. position
#       2. size
abstract type Thing end

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

# Functions that are applied for all Thing's
position(t::Thing) = t.position
size(t::Thing) = t.size
shape(t::Thing) = :unknown

# Type of weapons
@enum Weapon Laser Missile Gun

# Spaceship
struct Spaceship <: Thing
    position::Position
    size::Size
    weapon::Weapon
end
shape(s::Spaceship) = :saucer


struct Asteroid <: Thing
    position::Position
    size::Size
end

include("shape.jl")

# single-line functions to coordinate moving of the game pieces
move_up!(widget::Widget, to_move::Int) = widget.position.y -= to_move
move_down!(widget::Widget, to_move::Int) = widget.position.y += to_move
move_left!(widget::Widget, to_move::Int) = widget.position.x -= to_move
move_right!(widget::Widget, to_move::Int) = widget.position.x += to_move

function random_move()
    return rand([move_up!, move_down!, move_left!, move_right!])
end

function random_leap(w::Widget, move_func::Function, distance::Int)
    move_func(w, distance)
    return w
end

function clean_up_galaxy(asteroids, spaceships)
    ep = x -> println(x, " exploded!")
    foreach(ep, asteroids)
    foreach(ep, spaceships)
end

# Define pretty print functions
Base.show(io::IO, p::Position) = print(io, "(", p.x, ",", p.y, ")")
Base.show(io::IO, s::Size) = print(io, s.width, " x ", s.height)
Base.show(io::IO, w::Widget) = print(io, w.name, " at ", w.position, " size ", w.size)

function shoot(from::Widget, targets::Widget...)
    println("Type of targets: ", typeof(targets))
    for target in targets
        println(from.name, " --> ", target.name)
    end
end

# Function to make new asteroids
function make_asteroids(N::Int; pos_range=0:200, size_range=0:10:30)
    pos_rand() = rand(pos_range)
    sz_rand() = rand(size_range)
    return [Widget("Asteroid #$i", Position(pos_rand(), pos_rand()), Size(sz_rand(), sz_rand())) for i in 1:N]
end


# Function to make new spaceships
function make_spaceships(N::Int; pos_range=0:200, size_range=0:10:30)
    pos_rand() = rand(pos_range)
    sz_rand() = rand(size_range)
    return [Widget("Spaceship #$i", Position(pos_rand(), pos_rand()), Size(sz_rand(), sz_rand())) for i in 1:N]
end

# Special arrangement before attacks
function triangular_formation!(s1::Widget, s2::Widget, s3::Widget)
    x_offset = 30
    y_offset = 50
    s2.position.x = s1.position.x - x_offset
    s3.position.x =  s1.position.x + x_offset
    s2.position.y = s3.position.y = s1.position.y - y_offset
    # (s1, s2, s3)
end

# Random healthiness function for testing purposes
healthy(spaceship) = rand(Bool)

# make sure that the spaceship is healthy before any operation
function fire(f::Function, spaceship::Widget)
    if healthy(spaceship)
        f(spaceship)
    else
        println("Operation aborted as spaceship is not healthy")
    end
    return nothing
end

function process_file(func::Function, filename::AbstractString)
    ios = nothing
    try
        ios = open(filename)
        func(ios)
    finally
        close(ios)
    end
end



