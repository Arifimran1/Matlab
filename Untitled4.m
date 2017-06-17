f= imread('D:\backgroundDefault.jpg.jpg');
imshow(f);
g = imread('D:\backgroundDefault.jpg.jpg');
figure,imshow(g+f);
disp(f);
r = (f(:,:,1));
figure,imshow(r);
r = (f(:,1,:));
figure,imshow(r);
gra = rgb2gray(f);
figure, imshow(gra);

meanR = mean( f(:) );
stdR  = std( f(:) );

colorMoments = zeros(1, 2);
colorMoments(1, :) = [meanR stdR];
%size(f+6);
%imshow(f+f+f);
%[a,b,c] =figure(;;1);
