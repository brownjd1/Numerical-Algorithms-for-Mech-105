function I = Simpson(x,y)
% The Simpson function approximates the integral of a given function
%   Intputs
%         x - x values of the function
%         y - y values at the given x values
%     Outputs
%         I - approximation of the integral

%% Check for correct number of inputs
if nargin < 2
    error('Two inputs required')
elseif nargin > 2
    error('Too many inputs')
end

%% Check for appropriate dimensions
if size(x) ~= size(y)% Check that dimensions of x and y are equal
    error('Please enter variables of the same length')
end

%% Check for correct spacing
a = diff(x);% Finds spacing between elements
if range(a)>0.00000001
    error('Intervals must be equally spaced')
end

%% Find integration bounds
for i = 1 : (length(x) - 2)% Determine the x values
    x0 = x(i+1)-x(i);
end

%% Integrate
I = 0;% Initialize integral
if mod((length(x)-1),2) == 1% Even intervals : use trap rule
    warning('The trapezoidal rule has been used for the last interval of integration')
    iter=((length(x)-1)-1)/2;% Setting iterations for the trap rule
    for i = 1 : iter% Embeded for loop with trap rule
        I = I + (x0*((y(i+i-1)+4*(y(i+i))+y(i+i+1))/3));% Simpson's 1/3 rule
    end
    I = I + (x0*((y(length(x)))+y((length(x)-1)))/2);% Addition of trap rule
else
    iter=((length(x)-1))/2;% Setting iterations without trap rule
    for i=1:iter
        I = I + (x0*((y(i+i-1)+4*(y(i+i))+y(i+i+1))/3));% Simpson's 1/3 rule w/o trap rule
    end
end
end



