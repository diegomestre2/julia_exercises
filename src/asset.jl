abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end
abstract type Apartment <: Property end

abstract type FixedIncome <: Investment end
abstract type Equity <: Investment end

# Display the entire type hierarch starting from the specified 'roottype'
function subtypetree(roottype, level=1, indent=4)
    level == 1 && println(roottype)
    for s in subtypes(roottype)
        println(join(fill(" ", level * indent)) * string(s))
        subtypetree(s, level + 1, indent)
    end
end

# simple functions on abstract types
describe(a::Asset) = "Something valuable"
describe(e::Investment) = "Financial investment"
describe(e::Property) = "Physical property"

"""
    location(p::Property)
Returns the location of the property as a tuple of (latitude, longitude).
"""
location(p::Property) = error("Location is not defined int he concrete type")

function walking_distance(p1::Property, p2::Property)
    loc1 = location(p1)
    loc2 = location(p2)
    return abs(loc1.x - loc2.x) + abs(loc1.y - loc2.y)
end

mutable struct Stock <: Equity
    symbol::String
    name::String
end

function describe(s::Stock)
    return s.symbol * "(" * s.name * ")"
end

struct BasketOfStocks
    stocks::Vector{Stock}
    reason::String
end