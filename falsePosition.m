

function [root,fx,ea,iter] = falsePosition(func, xl,xu,es,maxiter)
    % falsePostition function approximates the roots of a function inputed
    % by the user
    %   inupts
    %       -func: function in terms of x 
    %           - If it is an ananymous function follow syntax @(x) func
    %       -xl: lower limit 
    %       -xu: upper limit
    %       -es: desired relative error (defaults to 0.0001%)
    %       -maxiter: max number of iterations (defaults to 200)
    %   outputs
    %       -root: approximated root
    %       -fx: given function evaluated at the root
    %       -ea: approximate error
    %       -iter: iterations performed
    if nargin < 3 %Check to make sure there are enough arguments
        error('Input at least 3 arguments \n')
    end
    %% Default 'es' if user doesn't provide an input
    if isempty('es') == 0
        es = 0.0001;
    end
    %% Default 'iter' if user doesn't provide an input
    if isempty('maxiter') == 0
        maxiter = 200;
    end
    %% Define Variables
    root = 0;
    ea = 100;
    iter = 0;
    xrp = 0;
    %% False Position
    while ea > es && iter < maxiter
        xrp = root;% Setting variable for relative error
        if (func(xl) * func(xu)) > 0% Checking for correct bounds 
            error('Idiot, pick correct bounds')
        end
        root = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        if (func(root)== inf) % Got to the perfect root on the first try
            fprintf('You found the perfect root!!!! \n')
            fprintf('The root is %f \n',root)
            fprintf('Function evaluated at root is %f \n',0)
            fprintf('Approximate error is %f \n',0)
            fprintf('Iterations performed: %0.0f \n',1)
            return
        end
        if (func(xl) * func(root)) < 0% Sign test
            xu = root;% Redefine upper bound
        else
            xl = root;% Redefine lower bound
        end
        if iter > 0
            ea = (abs((xrp - root)/(root))) * 100;% Relative error
        end
        iter = iter + 1;% Iteration counter
    end %end while
    %% Evaluating function at the approx. root
    fx = func(root);
    %% Outputs
    fprintf('The root is %f \n',root)
    fprintf('Function evaluated at root is %f \n',fx)
    fprintf('Approximate error is %f \n',ea)
    fprintf('Iterations performed: %0.0f \n',iter)
end


