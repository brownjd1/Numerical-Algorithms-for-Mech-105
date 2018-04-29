analyticalSolution = @(t_analytical) exp(((t_analytical.^3)/3) - 1.1*t_analytical);
Euler's h = 0.5
tic
t_eulers = 0:0.5:2;
y_eulers = zeros(1,length(t_eulers));
y_eulers(1) = 1;
h = 0.5;
dydt = @(t,y) y*t.^2 - 1.1*y;
slope = dydt(t_eulers(1),y_eulers(1));
for i = 2:length(t_eulers)
 y_eulers(i) = y_eulers(i-1)+(slope(i-1)*h);
 slope(i) = dydt(t_eulers(i),y_eulers(i));
end
toc
Elapsed time is 0.002833 seconds.
Heun's h = 0.5, without iteration
tic
% because initial es = 100, this skips iteration
[t_heun, y_heun] = Heun(dydt,[0 2],1,0.5,95,5000);
toc
Elapsed time is 0.000802 seconds.
Heun's h = 0.5, WITH iteration
tic
[t_heun_iter, y_heun_iter] = Heun(dydt,[0 2],1,0.5,0.00001,5000);
toc
Elapsed time is 0.000305 seconds.
Plot
fplot(analyticalSolution,[0 2])
hold on
plot(t_eulers, y_eulers,'gx--')
plot(t_heun, y_heun, 'ro--')
plot(t_heun_iter, y_heun_iter, 'm*--')
xlim([0 1.5])
xlabel('t');
ylabel('y');
legend('Analytical','Eulers h=0.5','Heun h=0.5','Heun with Iterh=0.5','Location','NorthWest')
% Oh the DRAMA!
% Ask class, what should x-limits be?
pause
xlim([0 2])
% What is happening here? Ideas on how to fix it?

Reduce step size 0.1
tic
[t_heun_iter_small, y_heun_iter_small] = Heun(dydt,[0
 2],1,0.1,0.00001,5000);
toc
plot(t_heun_iter_small,y_heun_iter_small,'cs--')
legend('Analytical','Eulers h=0.5','Heun h=0.5','Heun with Iterh=0.5','Heun with Iter h=0.1','Location','NorthWest')
Elapsed time is 0.003759 seconds.