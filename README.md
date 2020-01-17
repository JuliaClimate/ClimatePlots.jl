[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/JuliaClimate/ClimatePlots.jl.svg?branch=master)](https://travis-ci.org/JuliaClimate/ClimatePlots.jl)


# ClimatePlots.jl
Plotting library for Climate fields. Right now, it is compatible with [ClimateTools.jl](https://github.com/Balinus/ClimateTools.jl). The objective is to develop a generic geographic mapping library in Julia.

# Installation
Under the hood, ClimatePlots use Basemap for plotting gridded variables. Hence, PyCall should be configured so that the python distribution linked to PyCall is able to load basemap and matplotlib.

Installation steps are described [here](https://balinus.github.io/ClimateTools.jl/dev/installation/).

