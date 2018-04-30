
function [t,y] = Heun2(dydt,tspan,y0,h,es,maxit)
%Estimates a function based on the given differential equation by
%calculating a slope at the left point and right point of an interval and
%taking the average of the two slopes.
%Inputs
%dydt   -   Differential Equation
%tspan  -   Interval of t values
%y0     -   Initial value at x = 0
%h      -   Step size for t
%es     -   Maximum error between steps
%maxit  -   Maximum number of iterations
%
%Outputs
%t      -   Matrix of t values
%y      -   Matrix of y values

%Check number of inputs and set values if not specified
if(nargin < 4)
    error('Function needs at least 4 inputs')
elseif(nargin == 4)
    es = 0.001;
    maxit = 50;
elseif(nargin == 5)
    maxit = 50;
end
%Set initial values for iterations, error, t values and y values and
%slope

endh = rem(tspan,h);
ntspan = tspan - endh;

iter = 0;
er = intmax;
t=0:h:ntspan;
szt = size(t);
y = zeros(szt);
y(1) = y0;

%Calculate values of t
for i=0:h:(ntspan)
    %Set which step is being calculated
    iter = iter + 1;
    
    %Calculate slope on the left side of the interval
    slopel = dydt(t(iter),y(iter));
    slope = slopel;
    
    y(iter+1) = y(iter) + slope*h;
    
    %Set iteration to calculate the right slope and slope for Heun's method
    it = 0;
    
    %Check Conditions
    while((it < maxit) && (er > es))
        %Find y value from predicted slope

        %Calculate slope at y value
        sloper = dydt(t(iter+1),y(iter+1));
        
        %Take average of two slopes
        slope = (slopel + sloper)/2;
        %Calculate error between the right slope and the average slope
        if(it > 1)
            er = (sloper - slope)/slope;
        end
        y(iter+1) = y(iter) + slope*h;
        
        %Increase iterations of Heun's method
        it = it + 1;
    end
end
y(iter+1) = [];

if(endh ~= 0)
    t(iter+1) = t(iter) + endh;
    slopel = dydt(t(iter),y(iter));
    slope = slopel;
    
    y(iter+1) = y(iter) + slope*endh;
    
    %Set iteration to calculate the right slope and slope for Heun's method
    it = 0;
    
    while((it < maxit) && (er > es))
        %Find y value from predicted slope

        %Calculate slope at y value
        sloper = dydt(t(iter+1),y(iter+1));
        
        %Take average of two slopes
        slope = (slopel + sloper)/2;
        %Calculate error between the right slope and the average slope
        if(it > 1)
            er = (sloper - slope)/slope;
        end
        y(iter+1) = y(iter) + slope*endh;
        
        %Increase iterations of Heun's method
        it = it + 1;
    end
end

plot(t,y)
xlabel('t')
ylabel('y')
title('t vs y')
end