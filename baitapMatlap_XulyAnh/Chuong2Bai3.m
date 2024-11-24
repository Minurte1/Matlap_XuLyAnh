% ??c ?nh g?c
i = imread('Fig0316(4)(bottom_left).tif');
[m, n] = size(i); % Kích th??c ?nh

% Tính l??c ?? xám
histogram = zeros(1, 256); % L?u tr? l??c ?? xám
for x = 1:m
    for y = 1:n
        gray_value = i(x, y) + 1; % MATLAB ?ánh ch? s? t? 1
        histogram(gray_value) = histogram(gray_value) + 1;
    end
end

% Hi?n th? ?nh g?c và l??c ??
figure;
subplot(1, 2, 1);
imshow(i);
title('Anh goc');
subplot(1, 2, 2);
bar(0:255, histogram);
title('Luoc do xam goc');



% Tính phân b? tích l?y xác su?t (CDF)
cdf = zeros(1, 256);
cdf(1) = histogram(1);
for k = 2:256
    cdf(k) = cdf(k-1) + histogram(k);
end
cdf = cdf / (m * n); % Chu?n hóa v? [0, 1]

% Tính b?ng ánh x? m?c xám m?i
new_gray_levels = round(cdf * 255);

% Áp d?ng b?ng ánh x? lên ?nh g?c
i_eq = zeros(size(i), 'uint8');
for x = 1:m
    for y = 1:n
        old_value = i(x, y) + 1;
        i_eq(x, y) = new_gray_levels(old_value);
    end
end




% Tính l??c ?? m?i
new_histogram = zeros(1, 256);
for x = 1:m
    for y = 1:n
        new_value = i_eq(x, y) + 1;
        new_histogram(new_value) = new_histogram(new_value) + 1;
    end
end

% Hi?n th? ?nh sau cân b?ng và l??c ??
figure;
subplot(1, 2, 1);
imshow(i_eq);
title('Anh sau can bang muc xam');
subplot(1, 2, 2);
bar(0:255, new_histogram);
title('Luoc do xam sau khi can bang');
