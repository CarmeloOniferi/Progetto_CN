format long
% Definizione della matrice A e del vettore b
A = [7 2 1
     8 7 8
     7 0 7
     4 3 3
     7 0 10];
b = [1; 2; 3; 4; 5];

% Definizione dei pesi omega
omega = [0.5; 0.5; 0.75; 0.25; 0.25];
omega = omega ./ 2.25; % normalizzo i pesi in modo che la loro somma sia 1.

B = eye(5) .* sqrt(omega);
A = B * A;
b = B * b;

% così facendo, si minimizza la norma pesata
[x, pw] = miaqr(A, b);

disp('La soluzione nel senso dei minimi quadrati x è: ');
disp(x);
fprintf('La norma pesata del residuo (p_\x03C9) è: %.15f\n', pw);