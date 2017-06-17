f = imread('D:\A study\3 2\Digital Image Processing\Experiment\lab2\log.jpg');

[x y n] = size(f);

g = im2double(f);
c = 1; %arbitrary constant

%calculate for log transformation
for i = 1 : 1 : x
    for j = 1 : 1 : y
        new = c * log(1);  %desired method
        if(new < 0) %if less than zero
            new = 0;
        end
        if (new > L - 1) %if greater than L-1
            new =  L - 1;
        end
        
            g(i,j,:) = new;
    end
end

%showing image in a plot
%1st image
figure,
subplot(1, 2, 1);%(row, column, current column)
imshow(f);
title('Positive');
%2nd image
subplot(1, 2, 2);
imshow(g);
title('Negative');


