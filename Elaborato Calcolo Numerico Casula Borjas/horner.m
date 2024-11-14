function p_prime = horner(x, a, x_nodes)
%
% p_prime = derivata_horner(x, a, x_nodes)
%
% derivata_horner calcola la derivata di un polinomio in base Newton
% Utilizza l'algoritmo di Horner modificato per calcolare la
% derivata polinomio rappresentato nella base di Newton.
%
% INPUT:
%   x           - Il punto in cui calcolare la derivata del polinomio.
%   a           - Coefficienti del polinomio (array di numeri).
%   x_nodes     - Nodi del polinomio di Newton (array di numeri).
%
% OUTPUT:
%   p_prime     - Derivata del polinomio in x.
%

n = length(a); % Numero dei coefficienti
omega = ones(1, n); % Array per i valori di omega_i(x),
                   % inizializzato a 1
omega_prime = zeros(1, n); % Array per i valori di omega_i'(x),      
                          % inizializzato a 0
% Calcola omega_i(x) per ogni i
for i = 2:n
   for j = 1:i-1
     	omega(i) = omega(i) * (x - x_nodes(j));
   end
end

% Calcola omega_i'(x) per ogni i
for i = 2:n
   for k = 1:i
       product = 1;
       for j = 1:i
       	if j ~= k
               product = product * (x - x_nodes(j));
           end
       end
          omega_prime(i) = omega_prime(i) + product;
   end
end

% Applica il metodo di Horner modificato per calcolare
% la derivata del polinomio
p_prime = 0;
for i = n:-1:1
   p_prime = p_prime * x + a(i) * omega_prime(i);
end
end

