function rn = specialMatrix(n,m)
% Special Matrix
%   Input 
%       n - number of rows
%       m - number of columns
%   Out
%       matrix out - a matrix with the number of rows and columns as 
%       defined by the user. Each row will start with the number of the 
%       row and each column will start with the number of the column, 
%       with every other variable in the matrix being the sum of the 
%       element above it and the element to the left of it. 

%% Checking for error
if nargin <= 1 
    error('Please input an argument for n and m : specialMatrix(n,m)')
end
%% Define the matrix
A = zeros(n,m);% Define the matrix
%% Nested for loops
for r = 1 : n
    for c = 1 : m
        if r == 1
            A(r,c) = c;% Define target matrix cell and variable being 
            % placed
        elseif c == 1
            A(r,c) = r;% Define target matrix cell and variable being 
            % placed
        else 
            A(r,c) = A(r-1,c)+A(r,c-1);% Defines target matrix cell and 
            % variable being placed
        end
    end
end
%% Defining Output
rn = A;
            