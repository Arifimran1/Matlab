f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0310(b)(washed_out_pollen_image).tif');

%a) start
a1 = f;
[x y n] = size(a1);

info = imfinfo('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0304(a)(breast_digital_Xray).tif');
L = 2 .^(info.BitDepth /n);

g = im2double(f);

a = 3 * L / 8; %lowest value in img
b = 5 * L / 8; %highest value in img
nMax = (7 * L - 4) / 8; %input('new max');
nMin = L / 8; %input('new min');


%calculate for Power Law
for i = 1 : 1 : x
    for j = 1 : 1 : y
        r = g(i,j,:);
        new = (r - a) * ((nMax - nMin)/(b - a)) + a;  %desired method
        if(new < 0) %if less than zero
            new = 0;
        end
        if (new > L - 1) %if greater than L-1
            new =  L - 1;
        end
        g(i,j,:) = new;
    end
end

imshow(f);

