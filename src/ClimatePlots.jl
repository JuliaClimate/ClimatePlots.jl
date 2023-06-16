module ClimatePlots

using Dates
using CFTime
using AxisArrays
using Reexport
@reexport using ClimateTools
using PyCall
using PyPlot
using Statistics
import Base.show

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

include("types.jl")
include("maps.jl")
include("plots.jl")
include("maps_definition.jl")
include("utils.jl")

export plot, mapclimgrid, hist
export contourf, contour, pcolormesh
export BBox
export PlotInfo

end # module
