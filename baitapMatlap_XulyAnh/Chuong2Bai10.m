% a. N?p ?nh và gây nhi?u mu?i-tiêu 3%
f = imread('coins.png'); % ??c ?nh
f = double(f); % Chuy?n ??i ?nh sang ki?u double ?? tính toán

% Gây nhi?u mu?i-tiêu 3%
f_salt_pepper = imnoise(uint8(f), 'salt & pepper', 0.03);

% Hi?n th? ?nh g?c và ?nh nhi?u mu?i-tiêu
figure;
subplot(1, 2, 1), imshow(uint8(f)), title('?nh g?c');
subplot(1, 2, 2), imshow(f_salt_pepper), title('?nh nhi?u mu?i-tiêu 3%');

% b. L?c trung v? (t? th?c hi?n)
[m, n] = size(f_salt_pepper);  % Kích th??c ?nh
win_size = 3;  % Kích th??c c?a s? l?c (3x3)
pad_size = floor(win_size / 2);  % ?? dày c?a ph?n lót

% M? r?ng biên ?nh v?i ph??ng pháp 'symmetric'
f_salt_pepper_padded = padarray(f_salt_pepper, [pad_size, pad_size], 'symmetric');

% Kh?i t?o ?nh sau khi l?c
f_median_filtered = zeros(m, n);

% L?c trung v?
for i = 1:m
    for j = 1:n
        % L?y vùng lân c?n 3x3
        region = f_salt_pepper_padded(i:i+win_size-1, j:j+win_size-1);
        
        % Tính trung v? và gán giá tr? vào ?nh k?t qu?
        f_median_filtered(i, j) = median(region(:));
    end
end

% Chuy?n ?nh v? ki?u uint8
f_median_filtered = uint8(f_median_filtered);

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(f_median_filtered), title('?nh sau khi l?c trung v? (Mu?i-tiêu)');

% c. Gây nhi?u Gaussian 2% và l?c l?i
f_gaussian = imnoise(uint8(f), 'gaussian', 0, 0.02); % Gây nhi?u Gaussian 2%

% L?c ?nh b? nhi?u Gaussian (s? d?ng hàm t? t?o)
f_gaussian_filtered = zeros(m, n);

for i = 1:m
    for j = 1:n
        % L?y vùng lân c?n 3x3
        region = f_gaussian(i:i+win_size-1, j:j+win_size-1);
        
        % Tính trung v? và gán giá tr? vào ?nh k?t qu?
        f_gaussian_filtered(i, j) = median(region(:));
    end
end

% Chuy?n ?nh v? ki?u uint8
f_gaussian_filtered = uint8(f_gaussian_filtered);

% Hi?n th? ?nh nhi?u Gaussian và ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(f_gaussian), title('?nh nhi?u Gaussian 2%');
subplot(1, 2, 2), imshow(f_gaussian_filtered), title('?nh sau khi l?c trung v? (Gaussian)');
