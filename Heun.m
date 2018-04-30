function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
err = 100;% Initialize error
s = length(tspan);% Find size of domain
for i = tspan(1) : tspan(s) : h% Initialize for loop to run for the domain
    iter = 0;% Initialize iteration counter
    guess2 = y0;% Create variable to mark the guess
    while err > es || iter < maxit% embeded while loop runs until approx error condition is met
        slopeleft = dydt(i,y0);%evaluate dydt at y0 and i to find predictor slope
        guess1 = y0 + (h * slopeleft);%Use Euler's method to find y at i + 1
        sloperight = dydt(i+h,guess1);
        corrector = (y0 + ((h/2) * (slopeleft + sloperight))); %find the average value between y(i) and y(i+1) (y0 +
        %(h/2)*(slopeleft + sloperight)
        guess2 =  guess2 + (h * slopecorrect);%use corrector value to get a better estimate at y(i+1)
        err = ((abs(guess2 - guess1))/guess1)*100;
        iter = iter + 1;
    end
    t = i + 1;
    y = guess2;
    
end
end

