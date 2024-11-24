% ??c ?nh g?c
i = imread('Fig0316(4)(bottom_left).tif');
[m, n] = size(i); % K�ch th??c ?nh

% T�nh l??c ?? x�m
histogram = zeros(1, 256); % L?u tr? l??c ?? x�m
for x = 1:m
    for y = 1:n
        gray_value = i(x, y) + 1; % MATLAB ?�nh ch? s? t? 1
        histogram(gray_value) = histogram(gray_value) + 1;
    end
end

% Hi?n th? ?nh g?c v� l??c ??
figure;
subplot(1, 2, 1);
imshow(i);
title('Anh goc');
subplot(1, 2, 2);
bar(0:255, histogram);
title('Luoc do xam goc');



% T�nh ph�n b? t�ch l?y x�c su?t (CDF)
cdf = zeros(1, 256);
cdf(1) = histogram(1);
for k = 2:256
    cdf(k) = cdf(k-1) + histogram(k);
end
cdf = cdf / (m * n); % Chu?n h�a v? [0, 1]

% T�nh b?ng �nh x? m?c x�m m?i
new_gray_levels = round(cdf * 255);

% �p d?ng b?ng �nh x? l�n ?nh g?c
i_eq = zeros(size(i), 'uint8');
for x = 1:m
    for y = 1:n
        old_value = i(x, y) + 1;
        i_eq(x, y) = new_gray_levels(old_value);
    end
end




% T�nh l??c ?? m?i
new_histogram = zeros(1, 256);
for x = 1:m
    for y = 1:n
        new_value = i_eq(x, y) + 1;
        new_histogram(new_value) = new_histogram(new_value) + 1;
    end
end

% Hi?n th? ?nh sau c�n b?ng v� l??c ??
figure;
subplot(1, 2, 1);
imshow(i_eq);
title('Anh sau can bang muc xam');
subplot(1, 2, 2);
bar(0:255, new_histogram);
title('Luoc do xam sau khi can bang');
