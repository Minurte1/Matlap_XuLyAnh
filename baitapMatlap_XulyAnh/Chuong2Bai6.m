% ??c ?nh v� chuy?n ??i sang grayscale (n?u l� ?nh m�u)
I = imread('coins.png');
if size(I, 3) == 3
    I = rgb2gray(I); % Th? c�ng chuy?n sang ?nh x�m (n?u l� ?nh m�u)
end

% K�ch th??c ?nh
[m, n] = size(I);

% T�nh l??c ?? x�m th? c�ng
histogram = zeros(1, 256); % Kh?i t?o l??c ??
for i = 1:m
    for j = 1:n
        gray_value = I(i, j) + 1; % M?c x�m (ch? s? t? 1 trong MATLAB)
        histogram(gray_value) = histogram(gray_value) + 1;
    end
end

% Hi?n th? ?nh v� l??c ?? x�m
figure;
subplot(1, 2, 1);
imshow(I);
title('Anh goc');
subplot(1, 2, 2);
bar(0:255, histogram);
title('Luoc do xam anh goc');

% ??m s? ?i?m ?nh c� m?c x�m l� 60
gray_level = 60; % M?c x�m c?n truy v?n
disp(['So luong diem anh co muc xam ', num2str(gray_level), ': ', num2str(histogram(gray_level + 1))]);
