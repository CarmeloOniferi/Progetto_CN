function x = trilu(a, b, c, f)
%
%   x = trilu(a, b, c, f);
%
%   Risolve il sistena lineare tridiagonale.
%
%   Input:
%       a - vettore degli elementi diagonali;
%       b - vettore degli elementi sottodiagonali;
%       c - vettore degli elementi sopradiagonali;
%       f - vettore dei termini noti.
%
%   Output:
%       x - vettore soluzione.
%
    if nargin < 4
        error('Dati in ingresso insufficienti');
    end
    n = length(a);
    if length(f) ~= n || length(b) ~= n-1 || length(c) ~= n-1
        error('Dati in ingresso errati');
    end
    
    if a(1) == 0
        error('Fattorizzazione non definita');
    end
    x = f;
    for i = 1:n-1
        b(i) = b(i) / a(i);
        a(i+1) = a(i+1) - b(i) * c(i);
        if a(i+1) == 0
           error('Fattorizzazione non definita');
        end 
        x(i+1) = x(i+1) - b(i) * x(i);
    end
    x(n) = x(n) / a(n);
    for i = n-1:-1:1
        x(i) = (x(i) - c(i) * x(i+1)) / a(i);
    end
return