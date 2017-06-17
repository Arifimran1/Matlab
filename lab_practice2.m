f = imread('D:\A study\3 2\Digital Image Processing\Experiment\lab2\positive.jpg');

%size
[x y n] = size(f); %get x, y , and n
info = imfinfo('D:\A study\3 2\Digital Image Processing\Experiment\lab2\positive.jpg');
L = 2 ^ (info.BitDepth / n); %get L that is the high range of that image

g = f;
%calculate for image negative
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = L - 1 - g(i, j, :);  %desired method
        if(new < 0) %if less than zero
            new = 0;
        end
        if (new > L - 1) %if greater than L-1
            new =  L - 1;
        end
        
            g(i,j,:) = new;
    end
end
                

imshow(f); %show image
figure, %show another image
imshow(g);

%showing image in a plot
%1st image
figure,
subplot(1, 2, 1);%(row, column, current column)
imshow(f);
title('Positive');
%2nd image
subplot(1, 2, 2);
imshow(g);
title('Negative');



