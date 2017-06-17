f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0304(a)(breast_digital_Xray).tif');

%output for a) in a1
a1 = f;
[x y n] = size(a1);

info = imfinfo('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0304(a)(breast_digital_Xray).tif');
L = 2 .^(info.BitDepth /n);

for i = 1:x
    for j = 1:y
        in = L - 1 - a1(i,j,:);
        if(in < 0)
            in = 0;
        end
        if(in > L - 1)
            in = L-1;
        end
        a1(i,j,:) = in;
    end
end
%end a) and start b0)

f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0312(a)(kidney).tif');

a2 = im2double(f);
[x y n] = size(a2);

info = imfinfo('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0312(a)(kidney).tif');
L = 2 .^(info.BitDepth /n);

for i = 1:x
    for j = 1:y
        if((a2(i,j,:) > L / 4) && a2(i,j,:) < L / 2)
            in = (6 * L / 10);
        else
            in = (2 * L / 10);
        end
        a2(i,j,:) = in;
    end
end
%end b0) and start b1)

a3 = im2double(f);

for i = 1:x
    for j = 1:y
        if((a3(i,j,:) > L / 2) && a3(i,j,:) < 3 * L / 4)
            in = (8 * L / 10);
        else
            in = a3(i,j,:);
        end
        a3(i,j,:) = in;
    end
end
%end b) and start c)
%start c1

f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0308(a)(fractured_spine).tif');

Gamma = 0.6;
c = 1;
b1 = im2double(f);

for i = 1:x
    for j = 1:y
        b1(i,j,:) = c * b1(i,j,:) .^Gamma;
    end
end

Gamma = 0.4;
c = 1;
b2 = im2double(f);

for i = 1:x
    for j = 1:y
        b2(i,j,:) = c * b2(i,j,:) .^Gamma;
    end
end

Gamma = 0.3;
c = 1;
b3 = im2double(f);

for i = 1:x
    for j = 1:y
        b3(i,j,:) = c * b3(i,j,:) .^Gamma;
    end
end

%end c1 
%start c2

f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0309(a)(washed_out_aerial_image).tif');

Gamma = 3.0;
c = 1;
c1 = im2double(f);

for i = 1:x
    for j = 1:y
        c1(i,j,:) = c * c1(i,j,:) .^(1/Gamma);
    end
end

Gamma = 4.0;
c = 1;
c2 = im2double(f);

for i = 1:x
    for j = 1:y
        c2(i,j,:) = c * c2(i,j,:) .^Gamma;
    end
end

Gamma = 5.0;
c = 1;
c3 = im2double(f);

for i = 1:x
    for j = 1:y
        c3(i,j,:) = c * c3(i,j,:) .^Gamma;
    end
end








%output in subplot
subplot(3,3,1);
imshow(a1);
title('Negative');
subplot(3,3,2);
imshow(a2);
title('Intensity1');
subplot(3,3,3);
imshow(a3);
title('Intensity2');
subplot(3,3,4);
imshow(b1);
title('Gamma 0.6');
subplot(3,3,5);
imshow(b2);
title('Gamma 0.4');
subplot(3,3,6);
imshow(b3);
title('Gamma 0.3');

subplot(3,3,4);
imshow(c1);
title('Gamma 3');
subplot(3,3,5);
imshow(c2);
title('Gamma 4');
subplot(3,3,6);
imshow(c3);
title('Gamma 5');






