format long
n = 50;
x0 =zeros(n,1);
tol = [1e-3, 1e-8, 1e-13];
color = ['b', 'r', 'm'];
L = zeros(50, 3);
for i = 1:length(tol)
    [x,nit] = newtonNoPivoting(@fun, x0, tol(i));
    figure;
    plot(1:n, x, 'o', Color=color(i));
    title('Tolleranza',num2str(tol(i)));
    xlabel('Indice radice');
    ylabel('Valore di x');
    L(:,i) = x;
end
disp(L);