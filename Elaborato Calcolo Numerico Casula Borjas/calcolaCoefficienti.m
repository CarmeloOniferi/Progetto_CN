function kg = calcolaCoefficienti(n)
%
% w = newtoncotes_weights(n)
%
% Calcola i pesi della formula di quadratura di Newton-Cotes di grado n
% INPUT:
%   n    - grado della formula di Newton-Cotes
% OUTPUT:
%   w    - vettore dei pesi dei coefficienti
%

%controllo
if ~isnumeric(n) || n <= 0 || mod(n, 1) ~= 0
   error("Il grado n deve essere un numero intero positivo");
end

%inizializzazioni
x = 0:n;
kg = zeros(1, n+1);

%calcolo dei pesi usando polinomio Lagrange
for i = 1:n+1
   L = 1;
   for j = 1:n+1
       if j ~= i
           L = conv(L, [1,-x(j)]) / (x(i)-x(j));
       end
   end
   kg(i) = polyval(polyint(L), n);
end
end
