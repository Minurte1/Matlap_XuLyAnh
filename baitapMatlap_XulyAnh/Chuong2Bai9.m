% ??c ?nh ??u vào
f = imread('Fig0333(a)(test_pattern_blurring_orig).tif');
f = double(f); % Chuy?n ??i sang ki?u double ?? th?c hi?n tính toán

% Kích th??c ?nh
[m, n] = size(f);

% M?t n? l?c trung bình 3x3
w = (1/9) * [1 1 1; 1 1 1; 1 1 1];

% Kích th??c m?t n?
[w_rows, w_cols] = size(w);
pad_size = floor([w_rows, w_cols] / 2);

% M? r?ng biên ?nh (ph??ng pháp nhân b?n - replicate)
f_padded = zeros(m + 2 * pad_size(1), n + 2 * pad_size(2));
f_padded(pad_size(1)+1:end-pad_size(1), pad_size(2)+1:end-pad_size(2)) = f;

% L?p qua các pixel c?a ?nh m? r?ng và tính t?ng tích
g = zeros(m, n);
for i = 1:m
    for j = 1:n
        % Trích vùng pixel t??ng ?ng v?i m?t n?
        region = f_padded(i:i+w_rows-1, j:j+w_cols-1);
        
        % Tính t?ng tích (convolution)
        g(i, j) = sum(sum(region .* w));
    end
end

% ??m b?o giá tr? pixel n?m trong kho?ng [0, 255]
g = uint8(g);

% Hi?n th? ?nh sau khi l?c
figure;
imshow(g);
title('Anh sau  khi loc tuyen tinh');
