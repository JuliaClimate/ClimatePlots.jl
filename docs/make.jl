using Documenter, ClimatePlots

makedocs(sitename = "ClimatePlots.jl",
format = :html,
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
