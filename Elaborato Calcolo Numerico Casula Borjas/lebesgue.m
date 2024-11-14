function ll = lebesgue(a, b, nn, type)
% function ll = lebesgue(a, b, nn, type)
% Input: a,b = inizio e fine intervallo, nn = vettore con specificato il grado dei polinomi,
% type = specifica che tipo di ascisse di interpolazione usare
% se 0 utilizza le ascisse equispaziate nell'intervallo [a,b] altrimenti se
% 1 utilizza le ascisse di Chebyshev.
% Output: ll = vettore delle costanti di Lebesgue per ogni grado specificato in input
if nargin < 4
        error('parametri in ingresso insufficienti');
    elseif type == 0 % Ascisse equidistanti
        x = linspace(a, b, nn+1);
    elseif type == 1 % Ascisse di Chebyshev
        x =  chebyshev_es22(a, b, nn);
    else
        error('Tipo non valido. Usare 0 per ascisse equidistanti e 1 per ascisse di Chebyshev.');
    end
    
    n = length(x);
    % Calcolo della costante di Lebesgue
    xq = linspace(a, b, 10001);
    p = zeros(1, 10001);
    for i = 1:n
        v = [1:i-1, i+1:n];
        L = ones(size(xq));
        for j = v
            L = L .* (xq - x(j)) / (x(i) - x(j));
        end
        p = p + abs(L);
    end
    ll = max(p);
return
