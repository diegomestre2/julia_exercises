struct Rectangle
    top::Int
    left::Int
    bottom::Int
    right::Int
    # return two upper-left and lower-right points of the Rectangle
    Rectangle(p::Position, s::Size) = new(p.y + s.height, p.x, p.y, p.x + s.width)
end

# check if the two rectangles overlap
function overlap(A::Rectangle, B::Rectangle)
    return A.left < B.right && A.right > B.left && A.top > B.bottom && A.bottom < B.top
end

function collide(A::Thing, B::Thing)
    println("Checking collision of thing vs. thing")
    rectA = Rectangle(position(A), size(A))
    rectB = Rectangle(position(B), size(B))
    return overlap(rectA, rectB)
end

function collide(A::Spaceship, B::Spaceship)
    println("Checking collision of spaceship vs. spaceship")
    return true
end

function collide(A::Asteroid, B::Thing)
    println("Checking collision of asteroid vs. thing")
    return true 
end

function collide(A::Thing, B::Asteroid)
    println("Checking collision of thing vs. asteroid")
    return true
end

function collide(A::Asteroid, B::Asteroid)
    println("Checking collision of asteroid vs. asteroid")
    return true 
end

# ramdomly pick two things and check if they collide
function check_randomly(things)
    for i in 1:5
        two = rand(things, 2)
        collide(two...)
    end
end
