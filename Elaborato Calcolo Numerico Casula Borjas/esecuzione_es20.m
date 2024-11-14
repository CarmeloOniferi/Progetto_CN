xi = [0,2.5,5]; % Ascisse per l'interpolazione
xx = linspace(0,5); %default = 100

%definizione delle funzioni e valutazione di queste
f = @(x) exp(x / 2 + exp(-x)); % Funzione interpolanda
f1 = @(x) (1 / 2 - exp(-x)) .* exp(x / 2 + exp(-x)); % Derivata prima della funzione interpolanda
fi = f(xi);
f1i = f1(xi);

yy = hermite(xi, fi, f1i, xx); % Polinomio interpolante di Hermite

n = length(xi);
y = zeros(1,2*n);
x = zeros(1,2*n);
for i=1:n
    y(2*i-1:2*i) = [fi(i); f1i(i)];
    x(2*i-1:2*i) = [xi(i); xi(i)];
end
dd = diff_div_hermite(x,y);
y = horner_per_esercizio20(x,dd,xx); % Calcolo della derivata prima 
    % del polinomio interpolante nei punti xx

hold on;
plot(xx, f(xx), 'b', 'LineWidth', 1.2);% Plot della funzione interpolanda in blu
plot(xx, yy, 'g', 'LineWidth', 1.2); % Plot del polinomio interpolante in verde
plot(xx, f1(xx), 'c', 'LineWidth', 1.2); % Plot della derivata della funzione interpolanda in rosso
plot(xx, y, 'm', 'LineWidth', 1.2); % Plot della derivata del polinomio interpolante in magenta
plot(xi, f(xi), 'ro'); % Condizioni di interpolazione p(xi) = f(xi)
plot(xi, f1(xi),'ro'); % Condizioni di interpolazione p'(xi) = f'(xi)
xlabel('ascisse');
ylabel('ordinate');
hold off;

legend('Interpolanda', 'Polinomio Interpolante', 'Derivata Interpolanda', ...
    'Derivata Polinomio Interpolante', 'Location', 'best');



