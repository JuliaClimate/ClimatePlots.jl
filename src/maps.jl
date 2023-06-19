"""
    contourf(C::ClimGrid; region::String="auto", level, caxis, titlestr::String, cm::String="", ncolors::Int, center_cs::Bool, filename::String, cs_label::String)

Maps the time-mean average of ClimGrid C. If a filename is provided, the figure is saved in a png format.

Optional keyworkd includes precribed regions (keyword *region*, see list below). For 4D data, keyword *level* is used to map a given level (defaults to 1). *caxis* is used to limit the colorscale. *cm* is used to manually set the colorscale (see Python documentation for native colorscale keyword), *ncolors* is used to set the number of color classes (defaults to 12). Set *center_cs* to true to center the colorscale (useful for divergent results, such as anomalies, positive/negative temprature). *cs_label* is used for custom colorscale label.

## Arguments for keyword *region* (and shortcuts)
- Europe ("EU")
- NorthAmerica ("NA")
- Canada ("CA")
- Quebec, QuebecNSP ("QC", "QCNSP")
- Americas ("Ams")
- World, WorldAz, WorldEck4 ("W", "Waz", "Weck4")
- Greenwich ("Gr")

"""
function contourf(C::ClimGrid; region::String="auto", states::Bool=false,  rivers::Bool=false, borders::Bool=false, lakes::Bool=false, level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="", dpi=200)

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :contourf, caxis, cm, states, rivers, borders, lakes, center_cs, ncolors, level)

    # Empty-map generator
    status, ax, projection = mapclimgrid(PI)

    cs = ax.contourf(C.longrid, C.latgrid, PI.data, transform=cartopy.crs.PlateCarree(), cmap=PI.cm, vmin=PI.vmin, vmax=PI.vmax)

    # Colorbar
    if isempty(cs_label)
        cs_label = getunitslabel(C)
    end
    cbar = colorbar(cs, orientation = "vertical", shrink = 0.7, label=cs_label)

    # Title
    if isempty(titlestr)
        titlestr = titledef(C)
    end
    title(titlestr)

    # Save to "filename" if not empty
    if !isempty(filename)
        PyPlot.savefig(filename, dpi=dpi)
    end

    return true, ax, projection, cbar
end

"""
    contour(C::ClimGrid; region::String="auto", level, caxis, titlestr::String, cm::String="", ncolors::Int, center_cs::Bool, filename::String, cs_label::String)

Maps the time-mean average of ClimGrid C. If a filename is provided, the figure is saved in a png format.

Optional keyworkd includes precribed regions (keyword *region*, see list below). For 4D data, keyword *level* is used to map a given level (defaults to 1). *caxis* is used to limit the colorscale. *cm* is used to manually set the colorscale (see Python documentation for native colorscale keyword), *ncolors* is used to set the number of color classes (defaults to 12). Set *center_cs* to true to center the colorscale (useful for divergent results, such as anomalies, positive/negative temprature). *cs_label* is used for custom colorscale label.

## Arguments for keyword *region* (and shortcuts)
- Europe ("EU")
- NorthAmerica ("NA")
- Canada ("CA")
- Quebec, QuebecNSP ("QC", "QCNSP")
- Americas ("Ams")
- World, WorldAz, WorldEck4 ("W", "Waz", "Weck4")
- Greenwich ("Gr")

"""
function contour(C::ClimGrid; region::String="auto", states::Bool=false,  rivers::Bool=false, borders::Bool=false, lakes::Bool=false, level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="", dpi=200)

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :contour, caxis, cm, states, rivers, borders, lakes, center_cs, ncolors, level)

    # Empty-map generator
    status, ax, projection = mapclimgrid(PI)

    cs = ax.contour(C.longrid, C.latgrid, PI.data, transform=cartopy.crs.PlateCarree(), cmap=PI.cm, vmin=PI.vmin, vmax=PI.vmax)

    # Colorbar
    if isempty(cs_label)
        cs_label = getunitslabel(C)
    end
    cbar = colorbar(cs, orientation = "vertical", shrink = 0.7, label=cs_label)

    # Title
    if isempty(titlestr)
        titlestr = titledef(C)
    end
    title(titlestr)

    # Save to "filename" if not empty
    if !isempty(filename)
        PyPlot.savefig(filename, dpi=dpi)
    end

    return true, ax, projection, cbar

end

"""
    pcolormesh(C::ClimGrid; region::String="auto", level, caxis, titlestr::String, cm::String="", ncolors::Int, center_cs::Bool, filename::String, cs_label::String)

Maps the time-mean average of ClimGrid C. If a filename is provided, the figure is saved in a png format.

Optional keyworkd includes precribed regions (keyword *region*, see list below). For 4D data, keyword *level* is used to map a given level (defaults to 1). *caxis* is used to limit the colorscale. *cm* is used to manually set the colorscale (see Python documentation for native colorscale keyword), *ncolors* is used to set the number of color classes (defaults to 12). Set *center_cs* to true to center the colorscale (useful for divergent results, such as anomalies, positive/negative temprature). *cs_label* is used for custom colorscale label.

## Arguments for keyword *region* (and shortcuts)
- Europe ("EU")
- NorthAmerica ("NA")
- Canada ("CA")
- Quebec, QuebecNSP ("QC", "QCNSP")
- Americas ("Ams")
- World, WorldAz, WorldEck4 ("W", "Waz", "Weck4")
- Greenwich ("Gr")

"""
function pcolormesh(C::ClimGrid; region::String="auto", states::Bool=false,  rivers::Bool=false, borders::Bool=false, lakes::Bool=false, level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="", dpi=200)

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :pcolormesh, caxis, cm, states, rivers, borders, lakes, center_cs, ncolors, level)

    # Empty-map generator
    status, ax, projection = mapclimgrid(PI)

    cs = ax.pcolormesh(C.longrid, C.latgrid, PI.data, transform=cartopy.crs.PlateCarree(), cmap=PI.cm, vmin=PI.vmin, vmax=PI.vmax)

    # Colorbar
    if isempty(cs_label)
        cs_label = getunitslabel(C)
    end
    cbar = colorbar(cs, orientation = "vertical", shrink = 0.9, ticklocation="auto", label=cs_label)

    # Title
    if isempty(titlestr)
        titlestr = titledef(C)
    end
    title(titlestr)

    # Save to "filename" if not empty
    if !isempty(filename)
        PyPlot.savefig(filename, dpi=dpi)
    end

    return true, ax, projection, cbar
end


"""
    surface(C::ClimGrid)

Surface plot of ClimGrid C.
"""
function surface(C::ClimGrid; projection="moll", cmap=:deep)

C2 = periodmean(C)

Cmean = C2.data.data

longrid, latgrid = ClimateTools.getgrids(C)


# texttime(i) = string(C.model, " - ", year(timevec[i]), " - ", month(timevec[i]), " - ", day(timevec[i]))
titletext = C.model#"$(attrib["long_name"]), units=[$units], average of 19 years"

projection = projection
cmap = :deep

source = Projection("+proj=lonlat +lon_0=0")
dest = Projection("+proj=$projection +lon_0=0")

# source = LonLat()
# dest = WinkelTripel()

# xs, ys = xygrid(lons, lats)
Proj4.transform!(source, dest, vec(longrid), vec(latgrid))

# get aspect ratio
xmin, xmax = extrema(longrid)
ymin, ymax = extrema(latgrid)
aspect_ratio = (ymax - ymin) / (xmax - xmin)

total_crange = (minimum(Cmean), maximum(Cmean))
# total_crange = (0, 400)

# function plotfield(Amean, crange = (minimum(Amean), maximum(Amean));
#                    cmap = :viridis, titletext)
scene, layout = layoutscene(40; resolution = (900, 475));
# cmap = to_colormap(:viridis, 100)
earthscene = layout[1, 1] = LScene(scene);

sf = surface!(earthscene, longrid, latgrid, zeros(size(longrid)); color = Cmean,
        shading = false, show_axis = false, colorrange = crange, colormap = cmap);

geoaxis!(earthscene, -180, 180, -90, 90; crs = (src = source, dest = dest,));
coastlines!(earthscene; crs = (src = source, dest = dest,));

colorbar = layout[1, 2] = LColorbar(scene, sf, width = 20);
colsize!(layout, 1, Relative(1))
rowsize!(layout, 1, Aspect(1, aspect_ratio))
tt = layout[0, :] = LText(scene, titletext, textsize = 22);

return scene, sf, tt
# end

end
