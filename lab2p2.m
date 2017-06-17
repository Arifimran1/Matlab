

%%%%%
%%%% student id : 140231


f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0310(b)(washed_out_pollen_image).tif');

%a) start
a1 = f;
[x y] = size(a1);

info = imfinfo('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0310(b)(washed_out_pollen_image).tif');
%L = 2 .^(info.BitDepth /n);
L = 255;

a = min(a1(:)); %lowest value in img
b = max(a1(:)); %highest value in img
nMax = (7 * L - 4) / 8; %input('new max');
nMin = L / 8; %input('new min');


for i = 1:1:x
    for j = 1:1:y
        r = double(a1(i,j));
        a1(i,j) = (r - a) * ((nMax - nMin)/ (b - a)) + a;
    end
end

%start b)

f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0305(a)(DFT_no_log).tif');

[x y n] = size(f);

g = im2double(f);
c = 1; %arbitrary constant

%calculate for log transformation
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = c * log(1 + g(i, j, :));  %desired method
        g(i,j,:) = new;
    end
end

a2 = g;

%c) start

f = imread('D:\A study\3 2\Digital Image Processing\Experiment\lab2\dollar.JPG');
f = rgb2gray(f);

a3 = bitget(f, 2);
b1 = bitget(f, 3);
b2 = bitget(f, 4);
b3 = bitget(f, 5);
c1 = bitget(f, 6);
c2 = bitget(f, 7);
c3 = bitget(f, 8);

%histogram start
f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0323(a)(mars_moon_phobos).tif');

d1 = f;

d3 = histeq(f);


%output in subplot
subplot(3,3,1);
imshow(a1);
title('contrast');
subplot(3,3,2);
imshow(a2);
title('log');
subplot(4,3,3);
imshow(logical(a3));
title('bit2');
subplot(4,3,4);
imshow(logical(b1));
title('bit3');
subplot(4,3,5);
imshow(logical(b2));
title('bit4');
subplot(4,3,6);
imshow(logical(b3));
title('bit5');

subplot(4,3,7);
imshow(logical(c1));
title('bit6');
subplot(4,3,8);
imshow(logical(c2));
title('bit7');
subplot(4,3,9);
imshow(logical(c3));
title('bit8');


subplot(4,3,10);
imshow(d3);
title('histogram processing');
subplot(4,3,11);
imhist(d1);
title('histogram of image');
subplot(4,3,12);
imhist(d3);
title('Equalised histogram');

%write to a directory
imwrite(a1,'D:\A study\3 2\Digital Image Processing\lab\a1.jpg', 'jpg');
imwrite(a2,'D:\A study\3 2\Digital Image Processing\lab\a2.jpg', 'jpg');
imwrite(logical(a3),'D:\A study\3 2\Digital Image Processing\lab\a3.jpg', 'jpg');
imwrite(logical(b1),'D:\A study\3 2\Digital Image Processing\lab\b1.jpg', 'jpg');
imwrite(logical(b2),'D:\A study\3 2\Digital Image Processing\lab\b2.jpg', 'jpg');
imwrite(logical(b3),'D:\A study\3 2\Digital Image Processing\lab\b3.jpg', 'jpg');
imwrite(logical(c1),'D:\A study\3 2\Digital Image Processing\lab\c1.jpg', 'jpg');
imwrite(logical(c2),'D:\A study\3 2\Digital Image Processing\lab\c2.jpg', 'jpg');
imwrite(logical(c3),'D:\A study\3 2\Digital Image Processing\lab\c3.jpg', 'jpg');
imwrite(d3,'D:\A study\3 2\Digital Image Processing\lab\d3.jpg', 'jpg');



