function x = mialdl(A, b)
%
%   x = mialdl(A, b);
%
%   Risolve il sistema lineare Ax = b, con A matrice simmetrica e definita
%   positiva, mediante fattorizzazione LDLT di A.
%
%   Input:
%       A - matrice dei coefficienti;
%       b - vettore dei termini noti.
%
%   Output:
%       x - vettore soluzione.
%
    [m,n] = size(A);
    if m ~= n
        error('Matrice non quadrata');
    end
    k = length(b);
    if k ~= n
        error('Vettore dei termini noti errato');
    end

    if A(1,1) <= 0
        error('Matrice non sdp');
    end
    x = b;
    A(2:n,1) = A(2:n,1) / A(1,1);
    for j = 2:n
        v = (A(j,1:j-1).') .* diag(A(1:j-1,1:j-1));
        A(j,j) = A(j,j) - A(j,1:j-1) * v;
        if A(j,j) <= 0
            error('Matrice non sdp');
        end
        A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1) * v) / A(j,j);
    end
    
    %risolviamo per L
    for i = 2:n
        x(i:n) = x(i:n) - A(i:n,i-1) * x(i-1);
    end
    
    %risolviamo per D
    for i = 1:n
        x(i) = x(i) / A(i,i);
    end
    
    %risolviamo per L'
    for i = n:-1:2
        x(1:i-1) = x(1:i-1) - A(i,1:i-1).' * x(i);
    end
return