"""
    mapclimgrid(PI::PlotInfo)

Empty map generator.
"""
function mapclimgrid(PI)

    resolution = "auto"

    fig, ax = subplots()

    if lowercase(PI.region) == "canada" || lowercase(PI.region) == "ca"

        central_lon = -90
        central_lat = 50.0
        extent = [-130, -55, 35, 80]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)

    elseif lowercase(PI.region) == "usa"
        central_lon = -95
        central_lat = 20.0
        extent = [-120, -70, 22, 51]
        projection=cartopy.crs.AlbersEqualArea(central_longitude=central_lon, central_latitude=central_lat)

    elseif lowercase(PI.region) == "asia"
        central_lon = 100
        central_lat = 20.0
        extent = [70, 130, 0, 50]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)

    # elseif lowercase(region) == "west-asia" || lowercase(region) == "was"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection = "eqdc", resolution = "l", llcrnrlon=5.0, llcrnrlat=-30.0, urcrnrlon=145.0, urcrnrlat=50.0, lat_0=5.0, lon_0=65,  rsphere=(6378137.00, 6356752.3142))

    elseif lowercase(PI.region) == "quebec" || lowercase(PI.region) == "qc"
        central_lon = -75
        central_lat = 50.0
        extent = [-81.5, -52.6, 41, 62.5]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)
        resolution = "50m"

    elseif lowercase(PI.region) == "mauricie" 
        central_lon = -73
        central_lat = 47.0
        extent = [-76.0, -71.6, 46.1, 49.3]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)
        resolution = "10m"

    # elseif lowercase(region) == "americas" || lowercase(region) == "ams"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection = "omerc", resolution = "c", width=14000000, height=17000000, lon_0 = -100, lat_0 =    15, lon_1 = -45, lon_2 = -120, lat_1 = -55, lat_2 = 70)

    elseif lowercase(PI.region) == "arctic" || lowercase(PI.region) == "aps"
        extent = [-180, 180, 60, 90]
        proj_extent = cartopy.crs.PlateCarree()
        projection=cartopy.crs.NorthPolarStereo()

    elseif lowercase(PI.region) == "antarctic" || lowercase(PI.region) == "aaps"
        extent = [-180, 180, -90, -60]
        proj_extent = cartopy.crs.PlateCarree()
        projection=cartopy.crs.SouthPolarStereo()

    elseif lowercase(PI.region) == "europe" || lowercase(PI.region) == "eu"
        central_lon = 10.0
        central_lat = 50.0
        extent = [-12, 40, 30, 75]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)

    elseif lowercase(PI.region) == "africa" || lowercase(PI.region) == "afr"

        central_lon = 12.0
        central_lat = -30.0
        extent = [-20, 55, -32, 36]
        projection=cartopy.crs.PlateCarree()

    elseif lowercase(PI.region) == "northamerica" || lowercase(PI.region) == "na"
        central_lon = -95.0
        central_lat = 50.0
        extent = [-135.5, -55, 10, 80]
        projection=cartopy.crs.LambertConformal(central_longitude=central_lon, central_latitude=central_lat)

    elseif lowercase(PI.region) == "southamerica" || lowercase(PI.region) == "sa"
        central_lon = -60.0
        central_lat = -20.0
        extent = [-100, -30, -60, 17]
        projection=cartopy.crs.Mollweide(central_longitude=central_lon)

    elseif lowercase(PI.region) == "world" || lowercase(PI.region) == "w"
        central_lon = 0.0
        central_lat = 0.0
        extent = [-180, 180, -90, 90]
        projection=cartopy.crs.PlateCarree(central_longitude=central_lon)

    elseif lowercase(PI.region) == "mollweide" || lowercase(PI.region) == "moll"

        projection=cartopy.crs.Mollweide()

    elseif lowercase(PI.region) == "worldeck1" || lowercase(PI.region) == "weck1" || lowercase(PI.region) == "eck1" || lowercase(PI.region) == "eckert1"

        projection=cartopy.crs.EckertI()

    elseif lowercase(PI.region) == "worldeck2" || lowercase(PI.region) == "weck2" || lowercase(PI.region) == "eck2" || lowercase(PI.region) == "eckert2"

        projection=cartopy.crs.EckertII()

    elseif lowercase(PI.region) == "worldeck3" || lowercase(PI.region) == "weck3" || lowercase(PI.region) == "eck3" || lowercase(PI.region) == "eckert3"

        projection=cartopy.crs.EckertIII()

    elseif lowercase(PI.region) == "worldeck4" || lowercase(PI.region) == "weck4" || lowercase(PI.region) == "eck4" || lowercase(PI.region) == "eckert4"

        projection=cartopy.crs.EckertIV()

    elseif lowercase(PI.region) == "worldeck5" || lowercase(PI.region) == "weck5" || lowercase(PI.region) == "eck5" || lowercase(PI.region) == "eckert5"

        projection=cartopy.crs.EckertV()

    elseif lowercase(PI.region) == "worldeck6" || lowercase(PI.region) == "weck6" || lowercase(PI.region) == "eck6" || lowercase(PI.region) == "eckert6"

        projection=cartopy.crs.EckertVI()

    # elseif lowercase(region) == "outaouais"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection="lcc", resolution="h", llcrnrlon=-78.5, llcrnrlat=45., urcrnrlon=-73.866, urcrnrlat=48.0, lon_0=-75, lat_1=44, rsphere=(6378137.00, 6356752.3142))

    # elseif lowercase(region) == "south_quebec" || lowercase(region) == "south_qc"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection = "lcc", resolution = "l", llcrnrlon = -75.9, llcrnrlat = 42.6, urcrnrlon = -61.5, urcrnrlat = 49.5, lon_0 = -70, lat_1 = 50, rsphere = (6378137.00, 6356752.3142))

    # elseif lowercase(region) == "quebec_agricole" || lowercase(region) == "qc_agr"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection = "lcc", resolution="l", llcrnrlon=-80, llcrnrlat=44.2, urcrnrlon=-62.5, urcrnrlat=50.5, lon_0=-72, lat_1=50, rsphere = (6378137.00, 6356752.3142))

    # elseif lowercase(region) == "quebecnsp" || lowercase(region) == "qcnsp"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection = "nsper", resolution= "l", satellite_height = 2000000, lon_0 = -72.5, lat_0 = 55)

    # elseif lowercase(region) == "laurentides"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection="lcc", resolution="h", llcrnrlon=-76.5, llcrnrlat=45., urcrnrlon=-72.866, urcrnrlat=48.0, lon_0=-73.5, lat_1=44, rsphere=(6378137.00, 6356752.3142))

    # elseif lowercase(region) == "estrie"
    #     error("Not yet supported by new API")
    #     m = basemap.Basemap(projection="lcc", resolution="h", llcrnrlon=-73.0, llcrnrlat=44.5, urcrnrlon=-70.0, urcrnrlat=46.3, lon_0=-71.0, lat_1=45, rsphere=(6378137.00, 6356752.3142))

    elseif PI.region == "auto"
        central_lon = (PI.BBox.llon + PI.BBox.rlon)/2
        central_lat = (PI.BBox.nlat + PI.BBox.slat)/2
        extent = [PI.BBox.llon, PI.BBox.rlon, PI.BBox.slat, PI.BBox.nlat]
        projection=cartopy.crs.Robinson()

    end

    ax = plt.axes(projection=projection)
    if @isdefined extent
        if @isdefined proj_extent
            ax.set_extent(extent, proj_extent)
        else
            ax.set_extent(extent)
        end
    end

    if PI.states
        ax.add_feature(cartopy.feature.STATES)
    end
    if PI.rivers
        ax.add_feature(cartopy.feature.RIVERS)
    end
    if PI.borders
        ax.add_feature(cartopy.feature.BORDERS)
    end
    if PI.lakes
        ax.add_feature(cartopy.feature.LAKES)
    end

    # Draw the map properties
    ax.gridlines()
    ax.coastlines(resolution=resolution)

    return true, ax, projection

end
