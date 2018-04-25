function [x4] = paraInter(f,x1,x2,x3,n)
% paraInter does parabolic interplotation for a equation 
%   Inputs
%       -f: function
%       -x1: Initial Guess
%       -x2: -------------
%       -x3: -------------
%       -n: number of iterations
%   Outputs
%% Parabolic Interplotation
iter = 0;% Define iteration counter
while iter < n% Conditional loop that runs as long as the counter is less 
              % than the desired iterations
    numer = (((x2-x1)^2)*((f(x2)-f(x3)))-((x2-x3)^2)*(f(x2)-f(x1)));
    den = ((x2-x1)*(f(x2)-f(x3))-((x2-x3)*(f(x2)-f(x1))));
    x4 = x2 - .5*(numer/den);% Parabolic Interplotation to find x4
    if f(x4) < f(x2) && x4 > x2
        x1 = x2;
        x2 = x4;
        x3 = x3;
    elseif f(x4) < f(x3) && x3 > x2
        
        x2 = x4;
    else
        x3 = x4;
    end
    iter = iter + 1;
end
end

