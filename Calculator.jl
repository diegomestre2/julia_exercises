

export interest, rate

"""
    interest(amount, rate)

Calculate interest from an ;amout; and interest rate of 'rate'.
"""
function interest(amount, rate)
    return amount * (1 + rate)
end

"""
    rate(amount, interest)

Calculate interest rate based on an  'amount' and 'interest'.
"""

function rate(amount, interest)
    return interest / amount
end

"""
    sum(x::Number, y::Number) -> x + y
Calculate the sum of the two given parameters
"""
function sum(x::Number, y::Number)
    return x + y
end