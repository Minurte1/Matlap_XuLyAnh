% a. N?p ?nh v� g�y nhi?u mu?i-ti�u 3%
f = imread('coins.png'); % ??c ?nh
f = double(f); % Chuy?n ??i ?nh sang ki?u double ?? t�nh to�n

% G�y nhi?u mu?i-ti�u 3%
f_salt_pepper = imnoise(uint8(f), 'salt & pepper', 0.03);

% Hi?n th? ?nh g?c v� ?nh nhi?u mu?i-ti�u
figure;
subplot(1, 2, 1), imshow(uint8(f)), title('?nh g?c');
subplot(1, 2, 2), imshow(f_salt_pepper), title('?nh nhi?u mu?i-ti�u 3%');

% b. L?c trung v? (t? th?c hi?n)
[m, n] = size(f_salt_pepper);  % K�ch th??c ?nh
win_size = 3;  % K�ch th??c c?a s? l?c (3x3)
pad_size = floor(win_size / 2);  % ?? d�y c?a ph?n l�t

% M? r?ng bi�n ?nh v?i ph??ng ph�p 'symmetric'
f_salt_pepper_padded = padarray(f_salt_pepper, [pad_size, pad_size], 'symmetric');

% Kh?i t?o ?nh sau khi l?c
f_median_filtered = zeros(m, n);

% L?c trung v?
for i = 1:m
    for j = 1:n
        % L?y v�ng l�n c?n 3x3
        region = f_salt_pepper_padded(i:i+win_size-1, j:j+win_size-1);
        
        % T�nh trung v? v� g�n gi� tr? v�o ?nh k?t qu?
        f_median_filtered(i, j) = median(region(:));
    end
end

% Chuy?n ?nh v? ki?u uint8
f_median_filtered = uint8(f_median_filtered);

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(f_median_filtered), title('?nh sau khi l?c trung v? (Mu?i-ti�u)');

% c. G�y nhi?u Gaussian 2% v� l?c l?i
f_gaussian = imnoise(uint8(f), 'gaussian', 0, 0.02); % G�y nhi?u Gaussian 2%

% L?c ?nh b? nhi?u Gaussian (s? d?ng h�m t? t?o)
f_gaussian_filtered = zeros(m, n);

for i = 1:m
    for j = 1:n
        % L?y v�ng l�n c?n 3x3
        region = f_gaussian(i:i+win_size-1, j:j+win_size-1);
        
        % T�nh trung v? v� g�n gi� tr? v�o ?nh k?t qu?
        f_gaussian_filtered(i, j) = median(region(:));
    end
end

% Chuy?n ?nh v? ki?u uint8
f_gaussian_filtered = uint8(f_gaussian_filtered);

% Hi?n th? ?nh nhi?u Gaussian v� ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(f_gaussian), title('?nh nhi?u Gaussian 2%');
subplot(1, 2, 2), imshow(f_gaussian_filtered), title('?nh sau khi l?c trung v? (Gaussian)');
