# Numerical-Algorithms-for-Mech-105
This repository contains algorithims created in MATLAB for MECH 105
### Simpson Algorithm
The Simpson function approximates the integral of a given function
    
    I = Simpson(x,y)
    Intputs
        x - x values of the function
        y - y values at the given x values
    Outputs
        I - approximation of the integral
### dayCalc Algorithm
This function calculates the amount of days elapsed based off of a input given by the user

    dc = dayCalc(mo,da,leap)
    Input
        mo = month (numerical value)
        da = day (numerical value)
        leap = confirm leap year (1 = yes, 2 = no)
    Output
        dc = number of days elapsed up to the given date
### extrema Algorithm
The extrema function uses the golden ratio to estimate either a max or min of a given function

    [xr] = extrema(f,xl,xu,n,a)
    Inputs
        f - function
        xl - lower bound
        xu - upper bound
        n - desired number of iterations
        a - (0 or 1)
            0 - min extrema estimate
            1 - max extrema estimate
    Outputs
        xr - extrema estimate

       
