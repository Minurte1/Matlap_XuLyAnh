% B??c 1: ??c ?nh
i = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh

% B??c 2: T?o ?nh i3 t? bit plane th? 3 c?a ?nh i
i3 = bitget(i, 3);  % L?y bit plane th? 3

% B??c 3: T?o ?nh i6 t? bit plane th? 6 c?a ?nh i
i6 = bitget(i, 6);  % L?y bit plane th? 6

% B??c 4: T?o ?nh i78 t? bit plane th? 7 v� 8 c?a ?nh i
i78 = zeros(size(i));  % Kh?i t?o ?nh r?ng c�ng k�ch th??c v?i ?nh g?c

% L?y bit th? 7 v� 8 v� g�n v�o ?nh i78
i78 = bitset(i78, 7, bitget(i, 7));  % L?y bit th? 7 c?a ?nh g?c v� ??t v�o ?nh m?i
i78 = bitset(i78, 8, bitget(i, 8));  % L?y bit th? 8 c?a ?nh g?c v� ??t v�o ?nh m?i

% Hi?n th? c�c ?nh trong c�ng m?t c?a s? v?i subplot
figure;

subplot(1, 3, 1);  % ??t ?nh ??u ti�n v�o v? tr� 1
imshow(i3);  % Hi?n th? ?nh i3
title('?nh t? bit plane th? 3');

subplot(1, 3, 2);  % ??t ?nh th? hai v�o v? tr� 2
imshow(i6);  % Hi?n th? ?nh i6
title('?nh t? bit plane th? 6');

subplot(1, 3, 3);  % ??t ?nh th? ba v�o v? tr� 3
imshow(i78);  % Hi?n th? ?nh i78
title('?nh t? bit plane th? 7 v� 8');