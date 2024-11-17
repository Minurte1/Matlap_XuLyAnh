% B??c 1: ??c ?nh g?c
I = imread('cameraman.tif'); % ??c ?nh g?c

% B??c 2: L?u ?nh d??i ??nh d?ng JPEG v� PNG
imwrite(I, 'Ijpg.jpg');  % L?u ?nh d??i ??nh d?ng JPEG
imwrite(I, 'Ipng.png');  % L?u ?nh d??i ??nh d?ng PNG

% B??c 3: ??c l?i hai ?nh JPEG v� PNG
Ijpg = imread('Ijpg.jpg');  % ??c l?i ?nh JPEG
Ipng = imread('Ipng.png');  % ??c l?i ?nh PNG

% B??c 4: T�nh s? kh�c bi?t gi?a hai ?nh
X = imabsdiff(Ijpg, Ipng);  % T�nh s? kh�c bi?t tuy?t ??i gi?a hai ?nh

% Hi?n th? s? kh�c bi?t gi?a hai ?nh
figure;
imagesc(X);
title('S? kh�c bi?t gi?a ?nh JPEG v� PNG');
colorbar;