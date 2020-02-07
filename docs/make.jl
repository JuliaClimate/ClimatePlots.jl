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

deploydocs(
repo   = "github.com/JuliaClimate/ClimatePlots.jl.git",
# julia  = "1.0",
# osname = "linux",
target = "build"
# deps = nothing,
# make = nothing
)
