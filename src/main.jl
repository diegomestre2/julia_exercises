
include("Calculator.jl")
include("asset.jl")

x = interest(10, 0.1)
println("Interest: ", x)
sum_res = sum(x, 10)
println("Sum: ", sum_res)
