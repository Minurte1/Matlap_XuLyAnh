% ??c c�c ?nh
image_files = {'pillsetc.png', 'tape.png', 'coins.png', 'eight.tif'};

% T?o m?t figure duy nh?t ?? hi?n th? c�c ?nh
figure;

for k = 1:length(image_files)
    % ??c ?nh
    I = imread(image_files{k});
    
    % N?u ?nh l� ?nh m�u, chuy?n sang ?nh x�m
    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    % Chuy?n ?nh sang ki?u double ?? t�nh to�n
    I = double(I);
    
    % T�nh histogram c?a ?nh
    histogram = hist(I(:), 0:255);
    histogram = histogram / sum(histogram); % Chu?n h�a histogram

    % T�nh t?ng c?a c�c m?c x�m
    total_pixels = numel(I);
    sum_total = sum((0:255) .* histogram);

    % Kh?i t?o c�c bi?n
    weight_background = 0;
    sum_background = 0;
    max_variance = 0;
    threshold = 0;

    % T�nh ng??ng Otsu
    for t = 1:256
        % Tr?ng s? n?n v� ti?n c?nh
        weight_background = weight_background + histogram(t);
        weight_foreground = 1 - weight_background;

        if weight_background == 0 || weight_foreground == 0
            continue;
        end

        % T�nh t?ng m?c x�m n?n v� ti?n c?nh
        sum_background = sum_background + (t - 1) * histogram(t);

        % T�nh trung b�nh n?n v� ti?n c?nh
        mean_background = sum_background / weight_background;
        mean_foreground = (sum_total - sum_background) / weight_foreground;

        % T�nh ph??ng sai gi?a c�c l?p
        variance_between = weight_background * weight_foreground * (mean_background - mean_foreground)^2;

        % L?u ng??ng n?u ph??ng sai l?n nh?t
        if variance_between > max_variance
            max_variance = variance_between;
            threshold = t - 1;
        end
    end

    % Hi?n th? ng??ng Otsu ?� ch?n
    disp(['Nguong Otsu cho anh ', image_files{k}, ' la: ', num2str(threshold)]);

    % Ph�n ?o?n ?nh b?ng ng??ng Otsu
    binary_image = I > threshold;

    % Hi?n th? ?nh nh? ph�n trong subplot
    subplot(2, 2, k); % G?p 4 ?nh v�o 2x2 grid
    imshow(binary_image);
    title(['Anh nhi phan voi nguong Otsu - ', image_files{k}]);
end
