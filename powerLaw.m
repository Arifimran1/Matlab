f = imread('D:\A study\3 2\Digital Image Processing\Experiment\lab2\bone.jpg');

[x y n] = size(f);

g = im2double(f);
c = 1; %arbitrary constant
Gamma = 2.5;

%calculate for Power Law
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = c * ( double((g(i, j, :))).^Gamma);  %desired method
        g(i,j,:) = new;
    end
end

h = im2double(f);
c = 1; %arbitrary constant
Gamma = 0.6;

%calculate for Power Law
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = c * ( double((h(i, j, :))).^Gamma);  %desired method
        h(i,j,:) = new;
    end
end


m = im2double(f);
c = 1; %arbitrary constant
Gamma = 0.3;

%calculate for Power Law
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = c * ( double((m(i, j, :))).^Gamma);  %desired method
        m(i,j,:) = new;
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
title('Gamma 2.5');
subplot(2, 2, 3);%(row, column, current column)
imshow(h);
title('Gamma 0.6');
%2nd image
subplot(2, 2, 4);
imshow(m);
title('Gamma 0.3');


