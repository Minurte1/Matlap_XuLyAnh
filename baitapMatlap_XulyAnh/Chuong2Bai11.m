% ??c ?nh ??u v�o
f = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
f = double(f); % Chuy?n ?nh sang ki?u double ?? t�nh to�n

% K�ch th??c ?nh
[m, n] = size(f);

% -------------------
% L?C TUY?N T�NH (Trung b�nh 3x3)
% -------------------

% M?t n? trung b�nh 3x3
w = (1/9) * [1 1 1; 1 1 1; 1 1 1];
[w_rows, w_cols] = size(w);
pad_size = floor([w_rows, w_cols] / 2);

% M? r?ng bi�n ?nh (ph??ng ph�p nh�n b?n - replicate)
f_padded = zeros(m + 2 * pad_size(1), n + 2 * pad_size(2));

% Ch�n ?nh g?c v�o gi?a v�ng m? r?ng
f_padded(pad_size(1)+1:end-pad_size(1), pad_size(2)+1:end-pad_size(2)) = f;

% Nh�n b?n bi�n (d�ng ??u v� d�ng cu?i)
for i = 1:pad_size(1)
    f_padded(i, :) = f(1, :); % Nh�n b?n d�ng ??u ti�n
    f_padded(end-i+1, :) = f(end, :); % Nh�n b?n d�ng cu?i c�ng
end

% Nh�n b?n bi�n (c?t ??u v� c?t cu?i)
for j = 1:pad_size(2)
    f_padded(:, j) = f(:, 1); % Nh�n b?n c?t ??u ti�n
    f_padded(:, end-j+1) = f(:, end); % Nh�n b?n c?t cu?i c�ng
end

% L?c tuy?n t�nh (trung b�nh 3x3)
g_linear = zeros(m, n);
for i = 1:m
    for j = 1:n
        % Tr�ch v�ng 3x3 t? ?nh ?� m? r?ng
        region = f_padded(i:i+w_rows-1, j:j+w_cols-1);
        % T�nh trung b�nh
        g_linear(i, j) = sum(sum(region .* w));
    end
end

% -------------------
% L?C PHI TUY?N (Trung v? 3x3)
% -------------------

% M? r?ng bi�n ?nh theo ph??ng ph�p "symmetric"
f_padded = zeros(m + 2 * pad_size(1), n + 2 * pad_size(2));
f_padded(pad_size(1)+1:end-pad_size(1), pad_size(2)+1:end-pad_size(2)) = f;

% Nh�n b?n bi�n (d�ng ??u v� d�ng cu?i)
for i = 1:pad_size(1)
    f_padded(i, :) = f(1, :); % Nh�n b?n d�ng ??u ti�n
    f_padded(end-i+1, :) = f(end, :); % Nh�n b?n d�ng cu?i c�ng
end

% Nh�n b?n bi�n (c?t ??u v� c?t cu?i)
for j = 1:pad_size(2)
    f_padded(:, j) = f(:, 1); % Nh�n b?n c?t ??u ti�n
    f_padded(:, end-j+1) = f(:, end); % Nh�n b?n c?t cu?i c�ng
end

% L?c phi tuy?n (trung v?)
g_median = zeros(m, n);
for i = 1:m
    for j = 1:n
        % Tr�ch v�ng 3x3
        region = f_padded(i:i+w_rows-1, j:j+w_cols-1);
        % T�nh trung v?
        g_median(i, j) = median(region(:));
    end
end

% Chuy?n ?nh v? ki?u uint8
g_linear = uint8(g_linear);
g_median = uint8(g_median);

% -------------------
% HI?N TH? K?T QU?
% -------------------

figure;
subplot(1, 3, 1), imshow(uint8(f)), title('?nh g?c (nhi?u salt-and-pepper)');
subplot(1, 3, 2), imshow(g_linear), title('?nh sau l?c tuy?n t�nh');
subplot(1, 3, 3), imshow(g_median), title('?nh sau l?c trung v?');
