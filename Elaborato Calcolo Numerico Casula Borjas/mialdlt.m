function A = mialdlt(A)
%
%   A = mialdlt(A);
%
%   Calcola la fattorizzazione LDL' della matrice A sovrascrivendo la
%   porzione strettamente triangolare inferiore di A, con la porzione
%   strettamente triangolare inferiore di L, e sovrascrivendo la diagonale
%   di A con il fattore D.
%
%   Input:
%       A - matrice dei coefficienti.
%
%   Output:
%       A - matrice dei coefficienti in input, sovrascritta nella sua
%       porzione strettamente triangolare inferiore con la porzione
%       strettamente triangolare inferiore del fattore L e con la diagonale
%       sovrascritta dal fattore D.
%
    [m,n] = size(A);
    if m ~= n
        error('Errore: la matrice non e quadrata');
    end
    if A(1,1) <= 0
        error('Errore: la matrice non e sdp');
    end
    A(2:n,1) = A(2:n,1) / A(1,1);
    for j = 2:n
        v = (A(j,1:j-1).') .* diag(A(1:j-1,1:j-1));
        A(j,j) = A(j,j) - A(j, 1: j-1) * v;
        if A(j,j) <= 0
            error('Errore: la matrice non e sdp');
        end
        A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1) * v) / A(j,j);
    end
return