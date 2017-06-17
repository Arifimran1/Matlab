f1 = imread('images/Fig0338(a)(blurry_moon).tif');
f = im2double(f1);

%90 Degree invarient
filter = [0 1 0; 1 -4 1; 0 1 0];

%Laplacian image
ff = imfilter(f, filter);


fm = ff - min(ff(:));

%Grayish Laplacian image
fs = fm * (1 / max(fm(:)));
max(fm(:))

filter = filter - min(filter(:));

if(filter(2,2) > 0)
    c = 1;
else
    c = -1;
end


%Laplacian filtered image
g = f + c * fs;


%start (b)
f2 = imread('images/Fig0340(a)(dipxe_text).tif');
%[x y] = size(f2)

n = 15;
boxfilter = ones(n, n) / n .* n;

%blur the image
fb = imfilter( f2, boxfilter);
%[x y] = size(fb)

%subtraction
gmask = f2 - fb;

%add mask
%unsharped mask
k = 1;
g2 = f2 + k * gmask;

%highboost 
k = 50;
g22 = f2 + k * gmask;

%sobel
f3 = imread('images/Fig0342(a)(contact_lens_original).tif');

fx = [-1 -2 -1; 0 0 0; 1 2 1];
fy = [-1 0 1; -2 0 2; -1 0 1];

filter = fx + fy;
g3 = imfilter(f3, filter);


%subplot
subplot(3,4,1);
imshow(f1);
title('Original image(a)');

subplot(3,4,2);
imshow(ff);
title('Laplacian image');

subplot(3,4,3);
imshow(fs);
title('Grayish Laplacian image');

subplot(3,4,4);
imshow(g);
title('Laplacian filtered image');

subplot(3,4,5);
imshow(f2);
title('Original image(b)');

subplot(3,4,6);
imshow(g2);
title('Unsharp masked image');

subplot(3,4,7);
imshow(g22);
title('Highboost filtered image');

subplot(3,4,9);
imshow(f3);
title('Original image(c)');

subplot(3,4,10);
imshow(g3);
title('Sobel filtered image');













