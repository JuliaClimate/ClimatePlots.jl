using Pkg
Pkg.activate(@__DIR__)
CI = get(ENV, "CI", nothing) == "true"
using Documenter, ClimatePlots

makedocs(sitename = "ClimatePlots.jl",
doctest = false,
format = Documenter.HTML(
    prettyurls = CI,
    ),
pages = [
"index.md",
]

)

if CI
    deploydocs(
    repo   = "github.com/JuliaClimate/ClimatePlots.jl.git",
    target = "build"
    )
end
