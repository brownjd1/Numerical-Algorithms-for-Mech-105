function dc = dayCalc(mo,da,leap)
% Day Calculator
%   This function calculates the amount of days elapsed based off of a
%   input given by the user
%       Input
%           mo = month (numerical value)
%           da = day (numerical value)
%           leap = confirm leap year (1 = yes, 2 = no)
%       Output
%           dc = number of days elapsed up to the given date

%% Checking for error in mo input
if mo < 1 || mo > 12 
    error('Did you ever learn how many months are in a year?')
end
%% Checking for error in da input
if da < 1 
    error('This really should not be difficult')
end
%% Checking for error in leap input
if leap ~= 1 && leap ~= 0
    error('Please specify if it is a leap year (1 = Y,0 = N)')
end
%% Defining day count
dc = 0;
%% Checking for leap year
if leap == 1 && mo > 2
   feb = 29;
else 
   feb = 28;
end
%% Calculating day count
if mo == 1
    dc = da;
else
    A = [31,feb,31,30,31,30,31,31,30,31,30,31];
    for i = 1 : (mo-1)
        dc = dc + A(i);
    end
    dc = dc + da;
end
