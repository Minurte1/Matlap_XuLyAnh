I = imread('cell.tif');

% Truy xu?t và thay ??i giá tr? pixel t?i v? trí (100, 20)
i = 100;
j = 20;

% Hi?n th? giá tr? pixel ban ??u
original_value = I(i, j);

disp(['Giá tr? pixel ban ??u t?i (100,20): ', num2str(original_value)]);

% Th?c hi?n phép c?ng
I_plus = I;
I_plus(i, j) = I_plus(i, j) + 25; 
imshow(I_plus);
title('?nh sau khi c?ng 25');

% Th?c hi?n phép tr?
I_minus = I;
I_minus(i, j) = I_minus(i, j) - 25; % Gi?m giá tr? pixel ?i 25

disp(['Giá tr? pixel I_minus: ', num2str(I_minus(i, j))]);
imshow(I_minus);
title('?nh sau khi tr? 25');

[rows, cols] = size(I);

I1 = zeros(rows,cols,'uint8');
I2 =  zeros(rows,cols,'uint8');


for i = 1:rows
    for j  = 1:cols
        I1(i,j) = I(i,j)+25;
        if I1(i,j)>255
            I1(i,j)=255;
        elseif I1(i,j) < 0 
            I1(i,j) = 0;
        end
        I2(i,j)= I(i,j) +25;
        
        if I2(i,j) > 255
            I2(i,j) =255;
        elseif I2(i,j) <0 
            I2(i,j) = 0;
        end 
    end
end

figure;
subplot (1,2,1)
imshow(I1)
title('Anh T1 + 25 roi ne');
subplot(1,2,2);
imshow(I2)
title('Anh T2 + 25 rooi do ' );


            



