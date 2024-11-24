% ??c các ?nh
image_files = {'pillsetc.png', 'tape.png', 'coins.png', 'eight.tif'};

% T?o m?t figure duy nh?t ?? hi?n th? các ?nh
figure;

for k = 1:length(image_files)
    % ??c ?nh
    I = imread(image_files{k});
    
    % N?u ?nh là ?nh màu, chuy?n sang ?nh xám
    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    % Chuy?n ?nh sang ki?u double ?? tính toán
    I = double(I);
    
    % Tính histogram c?a ?nh
    histogram = hist(I(:), 0:255);
    histogram = histogram / sum(histogram); % Chu?n hóa histogram

    % Tính t?ng c?a các m?c xám
    total_pixels = numel(I);
    sum_total = sum((0:255) .* histogram);

    % Kh?i t?o các bi?n
    weight_background = 0;
    sum_background = 0;
    max_variance = 0;
    threshold = 0;

    % Tính ng??ng Otsu
    for t = 1:256
        % Tr?ng s? n?n và ti?n c?nh
        weight_background = weight_background + histogram(t);
        weight_foreground = 1 - weight_background;

        if weight_background == 0 || weight_foreground == 0
            continue;
        end

        % Tính t?ng m?c xám n?n và ti?n c?nh
        sum_background = sum_background + (t - 1) * histogram(t);

        % Tính trung bình n?n và ti?n c?nh
        mean_background = sum_background / weight_background;
        mean_foreground = (sum_total - sum_background) / weight_foreground;

        % Tính ph??ng sai gi?a các l?p
        variance_between = weight_background * weight_foreground * (mean_background - mean_foreground)^2;

        % L?u ng??ng n?u ph??ng sai l?n nh?t
        if variance_between > max_variance
            max_variance = variance_between;
            threshold = t - 1;
        end
    end

    % Hi?n th? ng??ng Otsu ?ã ch?n
    disp(['Nguong Otsu cho anh ', image_files{k}, ' la: ', num2str(threshold)]);

    % Phân ?o?n ?nh b?ng ng??ng Otsu
    binary_image = I > threshold;

    % Hi?n th? ?nh nh? phân trong subplot
    subplot(2, 2, k); % G?p 4 ?nh vào 2x2 grid
    imshow(binary_image);
    title(['Anh nhi phan voi nguong Otsu - ', image_files{k}]);
end
