function ll = lagrange(x, y, xx)
%
% function ll = lagrange(x, y, xx)
%
% Calcola il polinomio interpolante di Lagrange nei punti specificati in xx.
%
% INPUT:
% x          - vettore delle ascisse dei punti di interpolazione
% y          - vettore delle ordinate dei punti di interpolazione
% xx         - vettore dei punti in cui calcolare il polinomio interpolante
%
% OUTPUT:
% ll         - valori del polinomio interpolante nei punti xx
%

% Inizializzare il vettore dei valori del polinomio interpolante
ll = zeros(size(xx));
 % Loop su ciascun punto di interpolazione
for k = 1:length(x)
   % Inizializzare il termine di Lagrange Lk(x)
   Lkn = ones(size(xx));
   % Calcolare il termine di Lagrange Lk(x) per ogni punto xx
   for j = 1:length(x)
       if k ~= j
           Lkn = Lkn .* ((xx - x(j)) / (x(k) - x(j)));
       end
   end
   % Aggiungere il termine di Lagrange pesato al polinomio interpolante
   ll = ll + y(k) * Lkn;
end
end

