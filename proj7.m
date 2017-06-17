%project 7

f = imread('images/Fig0442(a)(characters_test_pattern).tif');

%f = [1 2 3 4; 4 5 6 7; 7 8 9 10];
f = im2double(f);
[x y] = size(f);
a = 2 * x;
b = 2 * y;

fp = zeros(a, b);

%zero padding
for i = 1:x
    for j = 1:y
        fp(i,j) = f(i,j);
    end
end

%multiply (-1)^(x+y)
for i = 1:a
    for j = 1:b
        fp(i,j) = fp(i, j) * (-1) .^ (i + j);
    end
end

%DFT
F = fft2(fp);

%Create Ideal lowpass filter
H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 160;
for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
        if (D <= D0) 
            H(i,j) = 1;
        end
    end
end

%disp(H);


%create G
G = H;


G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
ilf1 = zeros(x,y);
for i = 1:x
    for j = 1:y
        ilf1(i,j) = gp(i,j);
    end
end

%ideal lowpass filter D0 = 460

%Create Ideal lowpass filter
H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 460;
for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
        if (D <= D0)
            H(i,j) = 1;
        end
    end
end

%disp(H);


%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
ilf2 = zeros(x,y);
for i = 1:x
    for j = 1:y
        ilf2(i,j) = gp(i,j);
    end
end

%Butterworth LPF 160

H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 160;
n = 2;

for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
            
        
        H(i,j) = 1 / (1 + (D / D0) .^ (2*n));
        
    end
end



%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
blf1 = zeros(x,y);
for i = 1:x
    for j = 1:y
        blf1(i,j) = gp(i,j);
    end
end


%Butterworth 460

H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 460;
n = 2;

for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
            
        
        H(i,j) = 1 / (1 + (D / D0) .^ (2*n));
        
    end
end



%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
blf2 = zeros(x,y);
for i = 1:x
    for j = 1:y
        blf2(i,j) = gp(i,j);
    end
end


%Gaussian LPF 160

H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 160;
n = 2;

for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
            
        
        H(i,j) = exp((-D^2) / (2 * D0 .^2));
        
    end
end



%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
glf1 = zeros(x,y);
for i = 1:x
    for j = 1:y
        glf1(i,j) = gp(i,j);
    end
end

%Gaussian LPF 460

H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 460;
n = 2;

for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
            
        
        H(i,j) = exp((-D^2) / (2 * D0 .^2));
        
    end
end



%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
glf2 = zeros(x,y);
for i = 1:x
    for j = 1:y
        glf2(i,j) = gp(i,j);
    end
end

%Gaussian bandreject

H = zeros(a,b);
H = double(H);
p = round(a/2);
q = round(b/2);
D0 = 460;
n = 2;
w = 80;

for i = 1:a
    for j = 1:b
        D = sqrt((i-p).^2 + (j-q).^2);
            
        
        H(i,j) = 1 - exp(-((D^2 - D0^2) / (D * w)) .^2);
        
    end
end

ab1 = H;
%bandpass
HH = 1 - H;
ab2 = HH;
figure,
imshow(ab2);
figure,
imshow(ab1);
%create G
G = H;
G = F .* H;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
br = zeros(x,y);
for i = 1:x
    for j = 1:y
        br(i,j) = gp(i,j);
    end
end

%bandreject
%create G
G = HH;
G = F .* HH;

%finding gp
%finding IDFT
gp = ifft2(G);
%take real part
gp = real(gp);
%multiply -1
for i = 1:a
    for j = 1:b
        gp(i,j) = gp(i,j) * (-1) .^ (i+j);
    end
end

%obtain final filtered image
bp = zeros(x,y);
for i = 1:x
    for j = 1:y
        bp(i,j) = gp(i,j);
    end
end




subplot(3,4,1);
imshow(ilf1);
title('ILPF for D0=160');

subplot(3,4,2);
imshow(ilf2);
title('ILPF for D0=460');

subplot(3,4,3);
imshow(f);
title('Original Image');

subplot(3,4,4);
imshow(F);
title('DFT image');

subplot(3,4,5);
imshow(blf1);
title('BLPF for D0=160');

subplot(3,4,6);
imshow(blf2);
title('BLPF for D0=460');

subplot(3,4,7);
imshow(ab2);
title('Bandreject Filter');

subplot(3,4,8);
imshow(ab1);
title('Bandpass Filter');

subplot(3,4,9);
imshow(glf1);
title('GLPF for D0=160');

subplot(3,4,10);
imshow(glf2);
title('GLPF for D0=460');
