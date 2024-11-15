rng(0);
xi = linspace(0,2*pi,101);
yi = sin(xi) + rand(size(xi)) * .05;
M = zeros(101,4); %matrice 101 righe(date dalle 101 ascisse) e 4 colonne (grado 3)
for i = 1:101
    M(i,:) = xi(i) .^ (0:3);
end
x = miaqr(M,yi(:)); %coefficienti polinomio
y = polyval(flip(x'), xi);
plot(xi, yi, '.', xi, y);
xlabel('x');
ylabel('y');
grid on;