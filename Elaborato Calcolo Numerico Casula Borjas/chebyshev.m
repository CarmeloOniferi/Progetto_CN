function x = chebyshev(n, a, b)
%
% x = chebyshev(n, a, b)
%
% La funzione calcola le n+1 ascisse di Chebyshev nell'intervallo
% [a, b]
% 
% INPUT:
% 	n         - Numero di ascisse che vogliamo calcolare
% 	[a, b]    - Intervallo in cui vengono calcolate le ascisse di
%	            Chebyshev
%
% OUTPUT:
%     x          - Ascisse di Chebyshev calcolate sull'intervallo [a, b]
%
if(n<0), error('Grado del polinomio interpolante non valido!'),end
if(a>=b), error('Intervallo definito in maniera non corretta!'),end
n=n+1;
x(n:-1:1)=(a+b)/2+((b-a)/2)*cos(((2*(1:n)-1)*pi)/(2*n));
return