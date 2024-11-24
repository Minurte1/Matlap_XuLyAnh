% ??c ?nh và chuy?n ??i sang grayscale (n?u là ?nh màu)
I = imread('coins.png');
if size(I, 3) == 3
    I = rgb2gray(I); % Th? công chuy?n sang ?nh xám (n?u là ?nh màu)
end

% Kích th??c ?nh
[m, n] = size(I);

% Tính l??c ?? xám th? công
histogram = zeros(1, 256); % Kh?i t?o l??c ??
for i = 1:m
    for j = 1:n
        gray_value = I(i, j) + 1; % M?c xám (ch? s? t? 1 trong MATLAB)
        histogram(gray_value) = histogram(gray_value) + 1;
    end
end

% Hi?n th? ?nh và l??c ?? xám
figure;
subplot(1, 2, 1);
imshow(I);
title('Anh goc');
subplot(1, 2, 2);
bar(0:255, histogram);
title('Luoc do xam anh goc');

% ??m s? ?i?m ?nh có m?c xám là 60
gray_level = 60; % M?c xám c?n truy v?n
disp(['So luong diem anh co muc xam ', num2str(gray_level), ': ', num2str(histogram(gray_level + 1))]);
