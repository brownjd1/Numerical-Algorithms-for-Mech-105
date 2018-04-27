function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
err = 100;% Initialize error
s = length(tspan);% Find size of domain
for i = tspan(1) : tspan(s)% Initialize for loop to run for the domain
    while err < es% embeded while loop runs until approx error condition is met
        sloperight = %evaluate dydt at y0 and i to find predictor y value at i + 1
        %evaluate dydt at predictor y at i + 1
        slopeleft = %find the average value between y(i) and y(i+1) (y0 +
        %(h/2)*(slopeleft + sloperight)
        y(i) = %use corrector value to get a better estimate at y(i+1)
        err = %(abs((guess2 - guess1))/guess1)*100;
    end
end

