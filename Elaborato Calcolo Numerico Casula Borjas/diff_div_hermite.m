function dd = diff_div_hermite(x, y)
%
%   dd = diff_div_hermite(x, y);
%
%   Calcola le differenze divise per il polinomio interpolante di Hermite.
%
%   Input:
%       x - vettore delle ascisse raddoppiato;
%       y - vettore degli (fi, f1i), ovvero contentente i valori della
%           funzione e della sua derivata prima calcolati nelle ascisse x.
%
%   Output:
%       dd - differenze divise per il polinomio interpolante di Hermite
%           sulle ascisse x.
%
    if nargin < 2
        error('Parametri in ingresso insufficienti');
    elseif length(x) ~= length(y)
        error('Vettori in ingresso errati');
    end
    
    n = length(x) / 2;
    % Calcolo delle differenze divise
    for i = (2*n-1):-2:3
        y(i) = (y(i) - y(i-2)) / (x(i) - x(i-1));
    end
    for j = 2:2*n-1
        for i = (2*n):-1:j+1
            y(i) = (y(i) - y(i-1)) / (x(i) - x(i-j));
        end
    end
    dd = y;
return