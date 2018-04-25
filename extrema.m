function [xr] = extrema(f,xl,xu,n,a)
% The extrema function uses the golden ratio to estimate either a max or
% min of a given function
%   Inputs
%       f - function
%       xl - lower bound
%       xu - upper bound
%       n - desired number of iterations
%       a - (0 or 1)0 - min extrema estimate
%                   1 - max extrema estimate
%   Outputs
%       xr - extrema estimate
phi = ((1+sqrt(5))/2);% Define Golden Ratio
iter = 0;% Create iteration counter
while iter < n
    
    % Define d
    d = abs((xu-xl))*(phi-1);
    
    %Find new bounds
    x1 = xl + d;
    x2 = xu - d;
    
    if a == 1 && f(x1) > f(x2)% Replace lower bound
        xl = x2;
    elseif a == 1 && f(x1) < f(x2)% Replace upper bound
        xu = x1;
    elseif a == 0 && f(x1) > f(x2)% Replace lower bound
        xu = x1;
    else% Replace upper bound
        xl = x2;
    end
    iter = iter + 1;% Iteration counter
end
if f(x1) > f(x2)
    xr = x1;
else
    xr = x2;
end
fprintf('The extrema estimate is %0.5f \n',xr)
end

