using Dates
using AxisArrays
using ClimatePlots
using ClimateTools
using PyPlot
using Test

@testset "Mapping" begin

# Shapefile test
filenc = joinpath(dirname(@__FILE__), "data", "sresa1b_ncar_ccsm3-example.nc")

C = load(filenc, "tas")
# msk = inpolygrid(C.longrid, C.latgrid, P)
status, figh = mapclimgrid(C); @test status == true; PyPlot.close()

regions = ["World", "WorldAz", "Canada", "Quebec", "Quebec_agricole", "South_Quebec", "Americas", "NorthAmerica", "SouthAmerica", "Greenwich", "Outaouais", "Laurentides", "Estrie", "Arctic", "Antarctic", "Africa", "Europe", "Asia", "West-Asia"]

for iregion in regions
    status, figh = mapclimgrid(C, region=iregion);@test status == true; PyPlot.close()
end

# precip
C = load(filenc, "pr", data_units="mm") + 2.0

regions = ["World", "WorldAz", "Canada", "Quebec", "Quebec_agricole", "South_Quebec", "Americas", "NorthAmerica", "SouthAmerica", "Greenwich", "Outaouais", "Laurentides", "Estrie", "Arctic", "Antarctic", "Africa", "Europe", "Asia", "West-Asia"]

for iregion in regions
    status, figh = mapclimgrid(C, region=iregion);@test status == true; PyPlot.close()
end

status, figh = mapclimgrid(C, start_date=(2000, 05, 16, 12), end_date=(2000, 05, 16, 12));@test status == true; PyPlot.close()


# ua wind
filenc = joinpath(dirname(@__FILE__), "data", "sresa1b_ncar_ccsm3-example.nc")

C = load(filenc, "ua")
status, figh = mapclimgrid(C, level = 3);@test status == true; PyPlot.close() # given level
status, figh = mapclimgrid(C);@test status == true; PyPlot.close() # feeding a 4D field

# Empty maps
regions = ["World", "WorldAz", "Canada", "Quebec", "Quebec_agricole", "South_Quebec", "Americas", "NorthAmerica", "SouthAmerica", "Greenwich", "Outaouais", "Laurentides", "Estrie", "Arctic", "Antarctic", "Africa", "Europe", "Asia", "West-Asia"]

for iregion in regions
    status, figh = mapclimgrid(region=iregion);@test status == true; PyPlot.close()
end

# DUMMY MAPS
lon = collect(-180.0:180.0)
lat = collect(-90.0:90.0)
longrid, latgrid = ndgrid(lon, lat)
timeV = DateTime(2003,1,1):Day(1):DateTime(2003,01,31)
data = randn(361, 181, 31)
dimension_dict = Dict(["lon" => "lon", "lat" => "lat"])
varattribs = Dict(["standard_name" => "random noise"])
axisdata = AxisArray(data, Axis{:lon}(lon), Axis{:lat}(lat), Axis{:time}(timeV))
C = ClimateTools.ClimGrid(axisdata, variable = "psl", typeofvar="psl", longrid=longrid, latgrid=latgrid, dimension_dict=dimension_dict, varattribs=varattribs)

status, figh = mapclimgrid(C);@test status == true; PyPlot.close()
status, figh = mapclimgrid(C, center_cs=true, caxis=[200, 250]);@test status == true; PyPlot.close()
status, figh = mapclimgrid(C, center_cs=true, surface=:pcolormesh);@test status == true; PyPlot.close()


lon = collect(-180.0:180.0)
lat = collect(-90.0:90.0)
longrid, latgrid = ndgrid(lon, lat)
timeV = Dates.year(DateTime(2003, 01, 01)):Dates.year(1):Dates.year(DateTime(2004, 01, 01))
data = randn(361, 181, 2)
dimension_dict = Dict(["lon" => "lon", "lat" => "lat"])
varattribs = Dict(["standard_name" => "random noise"])
axisdata = AxisArray(data, Axis{:lon}(lon), Axis{:lat}(lat), Axis{:time}(timeV))
C = ClimateTools.ClimGrid(axisdata, variable = "psl", typeofvar="psl", longrid=longrid, latgrid=latgrid, dimension_dict=dimension_dict, varattribs=varattribs)

status, figh = mapclimgrid(C);@test status == true; PyPlot.close()

lon = collect(-180.0:180.0)
lat = collect(-90.0:90.0)
longrid, latgrid = ndgrid(lon, lat)
timeV = DateTime(2003, 01, 01):Day(1):DateTime(2004, 01, 01)
data = randn(361, 181, 366)
dimension_dict = Dict(["lon" => "lon", "lat" => "lat"])
varattribs = Dict(["standard_name" => "random noise"])
axisdata = AxisArray(data, Axis{:lon}(lon), Axis{:lat}(lat), Axis{:time}(timeV))
C = ClimateTools.ClimGrid(axisdata, variable = "psl", typeofvar="psl", longrid=longrid, latgrid=latgrid, dimension_dict=dimension_dict, varattribs=varattribs)

status, figh = plot(C); @test status == true; PyPlot.close()
status, figh = plot(C, xlimit=[2 5]); @test status==true;PyPlot.close()
status, figh = plot(C, label = "dummy", titlestr="dummytest", gridfig=true); @test status == true; PyPlot.close()

status, figh = hist(C); @test status == true; PyPlot.close()
status, figh = hist(C, ylimit=[2, 5]); @test status == true; PyPlot.close()
status, figh = hist(C, label = "dummy", titlestr="dummytest", gridfig=false); @test status == true; PyPlot.close()

end
