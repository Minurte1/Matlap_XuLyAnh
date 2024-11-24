% ??c ?nh g?c f
f = imread('Fig0122(a)(fractal-iris).tif');

% Kích th??c ?nh
[m, n] = size(f);

% T?o ?nh h b?ng cách ??t 4 bit th?p c?a m?i pixel v? 0
h = zeros(m, n, 'uint8'); % Kh?i t?o ?nh h
for i = 1:m
    for j = 1:n
        h(i, j) = bitand(f(i, j), 240); % Gi? l?i 4 bit cao, 240 = 11110000 (bit mask)
    end
end

% Hi?n th? ?nh g?c và ?nh h
figure;
subplot(1, 2, 1), imshow(f), title('Anh goc f');
subplot(1, 2, 2), imshow(h), title('Anh h (4 bit thap bang 0)');


% T?o ?nh g b?ng phép tr? t?ng pixel t??ng ?ng
g = zeros(m, n, 'int16'); % Kh?i t?o ?nh g v?i giá tr? pixel có th? âm
for i = 1:m
    for j = 1:n
        g(i, j) = int16(f(i, j)) - int16(h(i, j)); % Phép tr? pixel
    end
end

% Hi?n th? ?nh g
figure;
imshow(g, []); % Hi?n th? ?nh g v?i d?i ??ng toàn b?
title('Anh g (phep tru f - h)');


% Tính histogram ?nh g
g_min = min(g(:));
g_max = max(g(:));
g_range = g_max - g_min;

% Chu?n hóa giá tr? m?c xám c?a g v? [0, 255]
i = zeros(m, n, 'uint8'); % Kh?i t?o ?nh i
for x = 1:m
    for y = 1:n
        i(x, y) = uint8(255 * (double(g(x, y)) - double(g_min)) / g_range);
    end
end

% Hi?n th? ?nh cân b?ng m?c xám
figure;
imshow(i);
title('Anh i (cân b?ng m?c xám c?a g)');

