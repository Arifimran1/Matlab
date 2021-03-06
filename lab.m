%take an image of size 1000 x 800
f = imread('D:\A study\3 2\Digital Image Processing\aa.jpg');

%writing the output image to any location
imwrite(f, 'D:\A study\3 2\Digital Image Processing\anew.jpg', 'jpg');

%display the size of the image
[x y n] = size(f)


%displaying the image of each channel
r = f(:,:,1);
g = f(:,:,2);
b = f(:,:,3);


subplot(1, 3, 1);
imshow(r);
title('Red')

subplot(1, 3, 2);
imshow(g);
title('Green')

subplot(1, 3, 3);
imshow(b);
title('Blue')


imshow(r);
figure,
imshow(g);
figure,
imshow(b);

%add 50 to each intensity and display
for i = 1 : x
    for j = 1 : y
        
        f(i, j, :) = f(i, j, :) + 50;
        
    end
end
%f = f + 500;
figure,
imshow(f);

