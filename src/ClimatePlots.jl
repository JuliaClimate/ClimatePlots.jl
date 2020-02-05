module ClimatePlots

using Dates
using Reexport
@reexport using ClimateBase
using PyCall
using PyPlot
using Statistics

const basemap = PyNULL()
const mpl = PyNULL()
const plt = PyNULL()
const cmocean = PyNULL()
const cartopy = PyNULL()

function __init__()
    copy!(mpl, pyimport_conda("matplotlib", "matplotlib", "conda-forge"))
    copy!(plt, pyimport_conda("matplotlib.pyplot", "matplotlib", "conda-forge"))
    copy!(cmocean, pyimport_conda("cmocean", "cmocean", "conda-forge"))
    copy!(cartopy, pyimport_conda("cartopy", "cartopy", "conda-forge"))
end

include("mapping.jl")

export plot, mapclimgrid, hist

end # module
