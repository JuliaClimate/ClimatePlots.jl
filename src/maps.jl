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
function contourf(C::ClimGrid; region::String="auto", states::Bool=false,  level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="")

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :contourf, caxis, cm, states, center_cs, ncolors, level)

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
        PyPlot.savefig(filename, dpi=300)
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
function contour(C::ClimGrid; region::String="auto", states::Bool=false,  level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="")

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :contour, caxis, cm, states, center_cs, ncolors, level)

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
        PyPlot.savefig(filename, dpi=300)
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
function pcolormesh(C::ClimGrid; region::String="auto", states::Bool=true,  level=1, caxis=[], titlestr::String="", cm::String="", ncolors::Int=12, center_cs::Bool=false, filename::String="", cs_label::String="")

    # Build basic plot information
    PI = ClimatePlots.build_PlotInfo(C, region, :pcolormesh, caxis, cm, states, center_cs, ncolors, level)

    # Empty-map generator
    status, ax, projection = mapclimgrid(PI)

    cs = ax.pcolormesh(C.longrid, C.latgrid, PI.data, transform=cartopy.crs.PlateCarree(), cmap=PI.cm, vmin=PI.vmin, vmax=PI.vmax)

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
        PyPlot.savefig(filename, dpi=300)
    end

    return true, ax, projection, cbar
end
