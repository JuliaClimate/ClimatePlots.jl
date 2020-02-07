function get_cm(C::ClimGrid, cm, surface, center_cs, ncolors)

    if isempty(cm)
      if C[10] == "pr" || C[10]=="huss" || C[10]=="clwvi"
          cm = cmocean.cm.deep

      elseif C[10]=="tasmax" || C[10]=="tasmin" || C[10]=="tas" || C[10]=="tmax" || C[10]=="tmin" || C[10] == "wbgtmean" || C[10] == "wbgtmax" || C[10]=="t2m" || C[10]=="tmean" || C[10]=="dc" || C[10]=="hfls"
          cm = "RdYlBu_r"

      elseif C[10]=="psl" || C[10]=="vp"
          cm = cmocean.cm.deep_r

      elseif C[10]=="ua" || C[10]=="uv"
          cm = cmocean.cm.balance

      elseif C[10]=="clt" # cloud fraction
          cm = "Blues_r"

      elseif C[10]=="rlut" # longwave radiation
          cm = cmocean.cm.balance

      elseif C[10]=="hurs" || C[10]=="evspsbl"# longwave radiation
          cm = cmocean.cm.haline_r
      else
        cm = "viridis"
      end
    end

    # overide colorscale if the user specify to center the colorscale
    if center_cs
        cm = "RdBu_r"
    end

    if surface == :contourf || surface == :contour
        N = 256
    elseif surface == :pcolormesh
        N = ncolors
    end
    cmap = mpl.cm.get_cmap(cm)
    colorlist = cmap(range(0, stop=1, length=N))
    # #
    cm = mpl.colors.LinearSegmentedColormap.from_list("cm_custom", colorlist, N)

    return cm

end

"""
    getcslimits(caxis, data, C)

Returns minimum and maximum values of the colorscale axis. Used internally by [`mapclimgrid`](@ref).
"""
function getcslimits(caxis, data, center_cs)

    if !isempty(caxis)
        vmin = caxis[1]
        vmax = caxis[2]
    else
        vmin=minimum(data[.!isnan.(data)])
        vmax=maximum(data[.!isnan.(data)])
    end

    if center_cs # Hack, we want to center the divergent colorscale
        vmin = -vmax
    end

    return vmin, vmax


end

"""
    titledef(C::ClimGrid)

Returns the title. Used internally by [`mapclimgrid`](@ref).
"""
function titledef(C::ClimGrid)
    if ndims(C[1]) > 2

        if typeof((C[1][Axis{:time}][1])) <: AbstractCFDateTime || typeof((C[1][Axis{:time}][1])) == DateTime
            begYear = string(Dates.year(C[1][Axis{:time}][1]))
            endYear = string(Dates.year(C[1][Axis{:time}][end]))
        elseif typeof((C[1][Axis{:time}][1])) == Dates.Year
            begYear = string(C[1][Axis{:time}][1])[1:4]
            endYear = string(C[1][Axis{:time}][end])[1:4]
        elseif typeof((C[1][Axis{:time}][1])) == Int
            begYear = string(C[1][Axis{:time}][1])[1:4]
            endYear = string(C[1][Axis{:time}][end])[1:4]
        end
        titlestr = string(C[3], " - ", C[5], " - ", C.variable, " - ", begYear, " - ", endYear)

    else
        titlestr = string(C[3], " - ", C[5], " - ", C.variable)
    end

    return titlestr

end

"""
    getunitslabel(C::ClimGrid)

Return verbose label for colorbar. Used internally by [`mapclimgrid`](@ref).
"""
function getunitslabel(C::ClimGrid)

    try
        standardname = C.varattribs["standard_name"]
    catch
        standardname = C.varattribs["long_name"]
    end

    units = Dict(["air_temperature" => "Air temperature",
    "specific_humidity" => "Specific humidity (%)",
    "precipitation" => "Precipitation",
    "precipitation_flux" => "Precipitation flux",
    "air_pressure_at_sea_level" => "Air pressure at sea level",
    "eastward_wind" => "Eastward wind",
    "daily maximum temperature" => "Air temperature"
    ])

    label = ""

    try
        label = string(units[standardname], " (", C[2], ")")
    catch
        label = C[2]
    end

    return label

end

function roundup(i,v)
    return round(Int, i/v)*v
end
