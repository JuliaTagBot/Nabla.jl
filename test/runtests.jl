using AutoGrad2
using Base.Test

srand(123456789)

import Base.sum, AutoGrad2.∇

@get_gen_intercepts

eval(gen_intercepts(:explicit, :(sum(x::Union{AbstractArray, Real}))))
∇(::typeof(sum), ::Type{Arg{1}}, p, x::ArrayOrReal, y, ȳ) = broadcast!(x->x, similar(x), ȳ)
∇(x̄, ::typeof(sum), ::Type{Arg{1}}, p, x::ArrayOrReal, y, ȳ) = broadcast!(+, x̄, x̄, ȳ)

# @testset "AutoGrad2 tests" begin
begin

    # Code for checking sensitivities.
    include("finite_differencing.jl")
    include("finite_differencing_test.jl")

    # # The components of the package.
    include("core.jl")
    include("sensitivity.jl")

    # # Sensitivities for individual functions.
    include("sensitivities/scalar.jl")
    include("sensitivities/functional.jl")
    # include("sensitivities/array.jl")
    # include("sensitivities/linalg.jl")
    # include("sensitivities/blas.jl")

    # Some compositional functions for integration testing.
    # include("composite/simple.jl")

end
