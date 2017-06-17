f = imread('D:\A study\3 2\Digital Image Processing\Experiment\lab2\bean.jpg');

[x y n] = size(f);
info = imfinfo('D:\A study\3 2\Digital Image Processing\Experiment\lab2\bean.jpg');
L = 2 ^ (info.BitDepth / n); %get L that is the high range of that image

g = im2double(f);

a = min(g(:)); %lowest value in img
b = max(g(:)); %highest value in img
nMax = 255;%input('new max');
nMin = 0;%input('new min');
b = b-a;

%calculate for Power Law
for i = 1 : 1 : x
    for j = 1 : 1 : y
        r = g(i,j);
        new = (r - a) * ((nMax - nMin)/(b - a)) + a;  %desired method
        if(new < 0) %if less than zero
            new = 0;
        end
        if (new > L - 1) %if greater than L-1
            new =  L - 1;
        end
        g(i,j) = new;
    end
end


%showing image in a plot
%1st image
figure,
subplot(2, 2, 1);%(row, column, current column)
imshow(f);
title('Original');
%2nd image
subplot(2, 2, 2);
imshow(g);
title('Contrast Stretching');

