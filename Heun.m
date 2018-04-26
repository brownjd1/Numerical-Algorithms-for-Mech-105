function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
err = 100;% Initialize error
s = length(tspan);% Find size of domain
for i = tspan(1) : tspan(s)% Initialize for loop to run for the domain
    while err < es% embeded while loop runs until approx error condition is met
        slopel = dydt(
        err = %(abs((guess2 - guess1))/guess1)*100;
    end
end