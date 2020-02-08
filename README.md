[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/JuliaClimate/ClimatePlots.jl.svg?branch=master)](https://travis-ci.org/JuliaClimate/ClimatePlots.jl) [![codecov](https://codecov.io/gh/JuliaClimate/ClimatePlots.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaClimate/ClimatePlots.jl)


# ClimatePlots.jl
Plotting library for Climate fields. Right now, it is compatible with [ClimateTools.jl](https://github.com/JuliaClimate/ClimateTools.jl). The long term objective is to develop a generic climate mapping library in Julia.

# Installation
Under the hood, ClimatePlots use Cartopy for plotting gridded variables. Hence, PyCall should be configured so that the python distribution linked to PyCall is able to load cartopy and matplotlib.

Installation steps are described [here](https://juliaclimate.github.io/ClimateTools.jl/dev/installation/).


# ClimatePlots Documentation
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaclimate.github.io/ClimatePlots.jl/stable) [![](https://img.shields.io/badge/docs-latest-blue.svg)](https://juliaclimate.github.io/ClimatePlots.jl/dev)

# ClimateTools Documentation
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaclimate.github.io/ClimateTools.jl/stable) [![](https://img.shields.io/badge/docs-latest-blue.svg)](https://juliaclimate.github.io/ClimateTools.jl/dev)
