using Documenter, Nabla

makedocs(
    modules=[Nabla],
    format=:html,
    pages=[
        "Home" => "index.md",
        "API" => "pages/api.md",
        "Custom Sensitivities" => "pages/custom.md",
        "Details" => "pages/autodiff.md",
    ],
    sitename="Nabla.jl",
    authors="Invenia Labs",
    assets=[
        "assets/invenia.css",
    ],
)

deploydocs(
    repo = "github.com/invenia/Nabla.jl.git",
    julia = "1.0",
    target = "build",
    deps = nothing,
    make = nothing,
)
