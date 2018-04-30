function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%The Heun function uses Heun's method to approximate the y values given
%dydt of an equation and an initial value
%   Inputs
%       dydt - differential equation
%       tspan - interval [i n]
%       y0 - initial condition
%       h - step size
%       es - error condition
%       maxit - iteration conditon
%   Outputs
%       t - t values
%       y - approximated y values
%% Catch Errors
if nargin > 6
    error('Too many args')
end
if nargin < 4
    error('Too few args')
end
if nargin == 5% Default values
    maxit = 50;
end
if nargin == 4% Default Values
    maxit = 50;
    es = 0.001;
end
%% Define Variables
s = length(tspan);% Find size of domain
t = tspan(1) : h : tspan(s);
h = [h diff(t)];%Define h as all of the differences in t
y(1:length(t)) = 0;
y(1) = y0;
%% Calculate values
for i = 1 : length(t)-1 % Initialize for loop to run for the domain
    iter = 0;% Initialize iteration counter
    y(i+1) = y(i) + (h(i) * dydt(t(i),y(i)));%Use Euler's method to find y at i + 1
    ea = 100;% Initialize error
    while ea > es && iter < maxit% embeded while loop runs until approx error condition is met
        yold = y(i+1);% Store yold to calc error
        y(i+1) = (y(i) + ((h(i)/2) * (dydt(t(i),y(i)) + dydt(t(i+1),y(i+1))))); %find the average value between y(i) and y(i+1) (y0 +
        %(h/2)*(slopeleft + sloperight)
        ea = ((abs(y(i+1) - yold))/y(i+1))*100;% Calculate approx error
        iter = iter + 1;
    end
end
plot(t,y,'x--')%Plot points
xlabel('t values')
ylabel('est y values')
end

