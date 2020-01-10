module ClimatePlots


using Reexport
@reexport using ClimateTools
using PyCall
using PyPlot

const basemap = PyNULL()
const mpl = PyNULL()
const cmocean = PyNULL()
# const scipy = PyNULL()

function __init__()
    copy!(mpl, pyimport_conda("matplotlib", "matplotlib"))
    copy!(basemap, pyimport_conda("mpl_toolkits.basemap", "basemap"))
    copy!(cmocean, pyimport_conda("cmocean", "cmocean", "conda-forge"))
  # copy!(scipy, pyimport_conda("scipy.interpolate", "scipy"))
end

include("mapping.jl")

export plot, mapclimgrid, hist

end # module
