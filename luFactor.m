function [L,U,P] = luFactor(A)
%The function luFactor takes any sized square matrix and outputs a lower
%triangular matrix, an upper triangular matrix, and the pivot matrix
%   Inputs
%       - A : Square Matrix
%   Outputs
%       - L : Lower Triangular Matrix
%       - U : Upper Triangular Matrix
%       - P : Pivot Matrix

%% Storing the size of the inputed matrix
[m,n] = size(A);
%% Check for arguments
if isempty(A) == 1
    error('Input a matrix.')
elseif nargin > 1
    error('Too many input arguments. ')
elseif m ~= n 
    error('Input a square matrix.')
end
%% Create L
L = eye(n);% Initialize L
P = eye(n);% Initialize P
%% Determining the location of max abs value
for col = 1 : n - 1% Initialize for loop for columns
    %% Pivot U
    Z = eye(n);% Create a new identity matrix
    
    maxv = max(abs(A(col:n,col)));% Find max value
    [i,j] = find(abs(A(col:n,col)) == maxv);
    i = i + (col-1); % Adjust for relative address
    P([col i],:) = P([i col],:); % Tracker for pivot matrix
    Z([col i],:) = Z([i col],:); % Active pivot matrix
    L([col i],1:col-1) = L([i col],1:col-1);% Pivot element in L
    U = Z*A; % Create Matrix U
    %% Create Matrix U
   
    for row = 1 : n - col %Initialize for loop for rows
        elimrat = U(row+col,col)/U(col,col);% Elimination Ratio
        toprow = U(col,:);% Row being altered and subtracted
        bottrow = U(row+col,:);% Row being subtracted from
        U(row+col,:) = bottrow - (toprow * elimrat);% New row
        % Store elimrat in L for transformation
        L(col+row,col) = elimrat;% Begin to form L
    end
    
    A = U; %Redefine A
end










