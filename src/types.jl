struct BBox
    llon
    rlon
    slat
    nlat
end

function BBox(C::ClimGrid)

    llon = minimum(C.longrid)
    rlon = maximum(C.longrid)
    slat = minimum(C.latgrid)
    nlat = maximum(C.latgrid)

    return BBox(llon, rlon, slat, nlat)

end

struct PlotInfo
    data::Array{N,T} where N where T
    region::String
    BBox::BBox
    cm::ColorMap
    vmin::Real
    vmax::Real
    states::Bool
    rivers::Bool
    borders::Bool
    lakes::Bool
end

function build_PlotInfo(C::ClimGrid, region, surface, caxis, cm, states, rivers, borders, lakes, center_cs, ncolors, level)

    # Period average
    if ndims(C[1]) >= 3
        C = periodmean(C)
    end

    if ndims(C[1].data) == 3
        data2 = C[1].data[:,:,level]
    else
        data2 = C[1].data
    end

    # =================
    # PLOT DATA
    # =================
    # get boundaries and lat-lon vectors
    B = BBox(C)

    cm = get_cm(C, cm, surface, center_cs, ncolors)

    # Get colorscale limits
    vmin, vmax = getcslimits(caxis, data2, center_cs)

    return PlotInfo(data2, region, B, cm, vmin, vmax, states, rivers, borders, lakes)
end


Base.show(io::IO, ::MIME"text/plain", B::BBox) =
    print(io, "Bounding Box struct: \n",
              "Longitude 1: ", B.llon, "\n",
              "Lontitude 2: ", B.rlon, "\n",
              "Latitude 1:  ", B.slat, "\n",
              "Latitude 2:  ", B.nlat)
