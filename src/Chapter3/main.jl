include("widgets.jl")

# Main function to test position
function test_position()
    w = Widget("asteroid", Position(0, 0), Size(10, 20))
    move_up!(w, 10)
    println(w)
    move_down!(w, 10)
    println(w)
    move_left!(w, 20)
    println(w)
    move_right!(w, 20)
    
    # it should be back to Position(0, 0)
    println(w)
end

function test_shoot()
        # game
    make_asteroids(3)
    spaceship = Widget("Spaceship", Position(0, 0), Size(30, 30))
    target1 = asteroids[1]
    target2 = asteroids[2]
    target3 = asteroids[3]
    shoot(spaceship, target1)
    shoot(spaceship, target1, target2, target3)
end

function test_formation()
    spaceships = make_spaceships(3)
    triangular_formation!(spaceships...);
end

function test_cleanup()
    clean_up_galaxy(make_asteroids(3), make_spaceships(3))
end

function test_missile()
    make_asteroids(3)
    spaceship = Widget("Spaceship", Position(0, 0), Size(30, 30))
    fire(spaceship) do s
        move_up!(s, 100)
        println(s, " launched missile!")
        move_down!(s, 100)
    end
end

function test_file()
    process_file("/etc/hosts") do ios
        lines = readlines(ios)
        println(length(lines))
    end
end

function test_collide()
    s1 = Spaceship(Position(0, 0), Size(30, 5), Missile)
    s2 = Spaceship(Position(10, 0), Size(30, 5), Laser)
    s3 = Spaceship(Position(20, 0), Size(30, 5), Gun)
    a1 = Asteroid(Position(30, 0), Size(20, 20))
    a2 = Asteroid(Position(40, 0), Size(20, 20))
    a3 = Asteroid(Position(50, 0), Size(20, 20))
    collide(s1, s2)
    collide(s2, s3)
    collide(a1, a2)
    collide(a2, a3)
    collide(a1, s1)
end

function test_random_collide()
    s1 = Spaceship(Position(0, 0), Size(30, 5), Missile)
    s2 = Spaceship(Position(10, 0), Size(30, 5), Laser)
    s3 = Spaceship(Position(20, 0), Size(30, 5), Gun)
    a1 = Asteroid(Position(30, 0), Size(20, 20))
    a2 = Asteroid(Position(40, 0), Size(20, 20))
    a3 = Asteroid(Position(50, 0), Size(20, 20))
    check_randomly([s1,s2,s3,a1,a2,a3])
end

function test_parameters_type()
    a1 = Asteroid(Position(30, 0), Size(20, 20))
    a2 = Asteroid(Position(40, 0), Size(20, 20))
    explode([a1,a2])
    explode_2([:building, :hill])
end
function main()
    # test_position()
    # test_shoot()
    # test_formation()
    # test_cleanup()
    #test_missile()
    #test_file()
    test_parameters_type()
end


main()