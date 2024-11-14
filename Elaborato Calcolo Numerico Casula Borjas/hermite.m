 function yy = hermite(xi, fi, f1i, xx)
%   
%   yy = hermite(xi, fi, f1i, xx);
%   
%   Calcola il polinomio interpolante di Hermite definito dalle
%   terne di dati (xi, fi, f1i) nei punti del vettore xx.
% 
%   Input:
%       (xi,fi,f1i) - sono i dati del problema, dove fi ed f1i indicano 
%           rispettivamente il valore che le funzioni f(x) e f'(x)
%           assumono nel punto xi;
%       xx - vettore delle ascisse, non ancora raddoppiato, in cui
%           valutare il polinomio.
%
%   Output:
%       yy - polinomio interpolante in forma di Hermite valutato nei punti
%           del vettore delle ascisse xx opportunamente raddoppiato.
%
    if nargin < 4
        error('Parametri in ingresso insufficienti.');
    end
    n = length(xi);
    if n ~= length(fi) || n ~= length(f1i) || length(unique(xi)) ~= n
        error('parametri in ingresso errati');
    end

    x = zeros(1,2*n); % vettore delle ascisse raddoppiato
    y = zeros(1,2*n);
    x(1:2:2*n-1) = xi;
    x(2:2:2*n) = xi;
    y(1:2:2*n-1) = fi;
    y(2:2:2*n) = f1i;
    y = diff_div_hermite(x,y); % calcolo delle differenze divise
    
    n = n * 2;
    % valutazione del polinomio interpolante mediante algoritmo di
    % Horner generalizzato
    yy = y(n) * ones(1,length(xx));
    for i = n-1:-1:1
        yy = yy .* (xx - x(i)) + y(i);
    end
return