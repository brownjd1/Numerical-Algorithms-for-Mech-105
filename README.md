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
### falsePosition Algorithm
The falsePostition function approximates the roots of a function inputed by the user

    [root,fx,ea,iter] = falsePosition(func, xl,xu,es,maxiter)
    Inupts
        -func: function in terms of x 
        - If it is an ananymous function follow syntax @(x) func
        -xl: lower limit 
        -xu: upper limit
        -es: desired relative error (defaults to 0.0001%)
        -maxiter: max number of iterations (defaults to 200)
    Outputs
        -root: approximated root
        -fx: given function evaluated at the root
        -ea: approximate error
        -iter: iterations performed
### luFactor Algorithm
The function luFactor takes any sized square matrix and outputs a lower triangular matrix, an upper triangular matrix, and the pivot matrix

    [L,U,P] = luFactor(A)
    Inputs
        - A : Square Matrix
    Outputs
        - L : Lower Triangular Matrix
        - U : Upper Triangular Matrix
        - P : Pivot Matrix
### paraInter Algorithm
The paraInter function does parabolic interplotation for an equation 

    [x4] = paraInter(f,x1,x2,x3,n)
    Inputs
        -f: function
        -x1: Initial Guess
        -x2: -------------
        -x3: -------------
        -n: number of iterations
    Outputs
        -x4: Guess
### specialMatrix Algorithm
The specialMatrix function takes an input of the sizing of a square matrix with each row starting with the number of the row and each column will start with the number of the column, with every other variable in the matrix being the sum of the element above it and the element to the left of it. 
    
    [rn] = specialMatrix(n,m)
    Input 
        n - number of rows
        m - number of columns
    Output
        rn - special matrix
