clc, clearvars, close all
x = linspace(1,5/3, 100001); %genero centomilauno valori da 1 a 5/3
y = 1 + x.^2 + (log(abs(3*(1 - x) + 1))/80);
plot(x,y); %grafica i punti (x,y)
grid on;
xlabel('ascissa x');
ylabel('ordinata f(x)');
title('Grafico della funzione f(x)');

[min_value, min_index] = min(y); %restituisce il valore minimo e l'indice
min_x = x(min_index);
disp(['Il minimo della funzione si verifica in x = ', num2str(min_x), ' con valore f(x) = ', num2str(min_value)]);

% Calcolo dei limiti della funzione dove x si avvicina a 4/3
x_right = 4/3 + 0.001;  % x si avvicina a 4/3 da destra
x_left = 4/3 - 0.001;   % x si avvicina a 4/3 da sinistra

lim_right = 1 + x_right^2 + log(abs(3*(1 - x_right) + 1))/80;
lim_left = 1 + x_left^2 + log(abs(3*(1 - x_left) + 1))/80;

disp(['Limite della funzione dove x si avvicina a 4/3 da destra: ', num2str(lim_right)]);
disp(['Limite della funzione dove x si avvicina a 4/3 da sinistra: ', num2str(lim_left)]);