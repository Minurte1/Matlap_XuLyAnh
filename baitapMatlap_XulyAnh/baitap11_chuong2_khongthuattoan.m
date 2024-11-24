% a. ??c ?nh
i = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');  % ??c ?nh v�o bi?n i

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
end

% Chuy?n ?nh v? ki?u double ?? x? l� to�n h?c
i = double(i);

% b. L?c tuy?n t�nh (M?t n? trung b�nh 3x3)
[M, N] = size(i);
w = ones(3, 3) / 9;  % M?t n? trung b�nh 3x3

% T?o ?nh ??u ra cho l?c tuy?n t�nh
g_linear = zeros(M, N);

% Duy?t qua t?ng pixel c?a ?nh
for row = 2:M-1
    for col = 2:N-1
        % L?y m?t v�ng 3x3 xung quanh pixel (row, col)
        region = i(row-1:row+1, col-1:col+1);
        % �p d?ng m?t n? trung b�nh v� t�nh gi� tr? pixel m?i
        g_linear(row, col) = sum(sum(region .* w));
    end
end

% Chuy?n k?t qu? v? l?i ki?u uint8
g_linear = uint8(g_linear);

% c. L?c phi tuy?n (L?c trung v? 3x3)
g_median = zeros(M, N);

% Duy?t qua t?ng pixel c?a ?nh
for row = 2:M-1
    for col = 2:N-1
        % L?y m?t v�ng 3x3 xung quanh pixel (row, col)
        region = i(row-1:row+1, col-1:col+1);
        % T�nh gi� tr? trung v? c?a v�ng 3x3
        g_median(row, col) = median(region(:));
    end
end

% Chuy?n k?t qu? v? l?i ki?u uint8
g_median = uint8(g_median);

% d. Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh g?c v� c�c ?nh sau khi l?c
subplot(1, 3, 1), imshow(uint8(i)), title('?nh g?c');
subplot(1, 3, 2), imshow(g_linear), title('L?c tuy?n t�nh');
subplot(1, 3, 3), imshow(g_median), title('L?c phi tuy?n (Trung v?)');
