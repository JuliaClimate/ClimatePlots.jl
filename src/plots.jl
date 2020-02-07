"""
    plot(C::ClimGrid, titlefig::String, gridfig::Bool, label::String, color, lw, linestyle)

Plots the spatial average timeserie of ClimGrid `C`.
"""
function PyPlot.plot(C::ClimGrid; level=1, titlestr::String="", gridfig::Bool=true, label::String="", lw=1.5, linestyle="-", xlimit=[], ylimit=[], filename::String="")

    data = C[1].data
    timevec = get_timevec(C)

    if typeof(timevec[1]) != Date
        if typeof(timevec[1]) == Dates.Year
            timevec = Date.(timevec)
        end
    end

    average = fill(NaN, length(timevec))

    # Spatial mean for each timestep
    for t in 1:length(timevec)
        if ndims(data) == 3
            datatmp = data[:, :, t]
            # average[t] = Images.meanfinite(datatmp, 1:2)[1]
            average[t] = Statistics.mean(datatmp[.!isnan.(datatmp)])
        elseif ndims(data) == 4
            datatmp = data[:, :, level, t]
            average[t] = Statistics.mean(datatmp[.!isnan.(datatmp)])
        end
    end

    # figh, ax = subplots()

    if isempty(label)
        label = C.model
    end

    # Convert timevec to an array of string
    timevec_str = string.(timevec)
    if length(timevec) >= 20
        nb_interval_tmp = length(timevec)/8
        nb_int = ClimatePlots.roundup(nb_interval_tmp, 5)
    else
        nb_int = 1
    end

    # PLOTTING
    figh = PyPlot.plot(1:length(timevec_str), average, lw=lw, label=label, linestyle=linestyle)
    xticks(1:nb_int:length(timevec_str), timevec_str[1:nb_int:end], rotation=10)
    if !isempty(xlimit)
        xlim(xlimit[1], xlimit[2])
    end
    if !isempty(ylimit)
        ylim(ylimit[1], ylimit[2])
    end
    # xlabel("Time")
    ylabel(C.dataunits)
    legend()
    # xticks(timevec[1:20:end])
    if isempty(titlestr)
        titlestr = C.variable
    end
    title(titlestr)
    if gridfig
        grid(true)
    end

    # Save to "filename" if not empty
    if !isempty(filename)
        PyPlot.savefig(filename, dpi=300)
    end

    return true, figh

end

"""
    hist(C::ClimGrid; bins::Int=10, level=1, range_x=[], poly=[], start_date::Tuple=(Inf,), end_date::Tuple=(Inf,), titlestr::String="", gridfig::Bool=true, label::String="", ylimit=[])
"""
function PyPlot.hist(C::ClimGrid; bins::Int=10, level=1, range_x=[], titlestr::String="", gridfig::Bool=true, label::String="", ylimit=[])

    if isempty(label)
        label = C.model
    end

    # PLOTTING
    if gridfig
        grid(true)
    end
    if isempty(range_x)
        range_x = (findmin(C, skipnan=true)[1], findmax(C, skipnan=true)[1])
    end

    figh = hist(C[1].data[:], bins=bins, label=label, range=range_x)

    if !isempty(ylimit)
        ylim(ylimit[1], ylimit[2])
    end
    # xlabel("Time")
    ylabel("Frequency")
    legend()
    # xticks(timevec[1:20:end])
    if isempty(titlestr)
        titlestr = C.variable
    end
    title(titlestr)

    return true, figh

end
