f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0304(a)(breast_digital_Xray).tif');

%output for a) in a1
a1 = f;
[x y n] = imsize(a1);

info = infinfo('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0304(a)(breast_digital_Xray).tif');
L = info.bitdepth /n;
