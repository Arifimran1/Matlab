
f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0333(a)(test_pattern_blurring_orig).tif');

b0 = f;
%c = input('input:');


n = 11;
%b1 = imboxfilt(b0, 11);

h = ones(n,n) / (n * n);

b1 = imfilter(b0,h);

h = [1 2 1; 2 4 2; 1 2 1] / 16;

b2 = imfilter(b0, h);


%for median with zero pading

f = imread('D:\A study\3 2\Digital Image Processing\DIP3E_Original_Images_CH03\Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');

[x y] = size(f);

g = padarray(f, [1,1]);

n = 3;
filter = zeros(1,n .* n);
a1 = g;

for i = 1:x
    for j = 1:y
        q = 1;
        
        for k = i:(i+n-1)
           % r = 1;
            for l = j:(j+n-1)
                filter(1, q) = g(k, l);
                
                %r = r + 1;
                q = q + 1;
            end
            %q = q + 1;
        end
        %disp(filter);
        a1(i+1, j+1) = median(filter);
    end
end


%for min filter
a2 = g;
for i = 1:x
    for j = 1:y
        q = 1;
        
        for k = i:(i+n-1)
           % r = 1;
            for l = j:(j+n-1)
                filter(1, q) = g(k, l);
                
                %r = r + 1;
                q = q + 1;
            end
            %q = q + 1;
        end
        %disp(filter);
        a2(i+1, j+1) = min(filter);
    end
end

%for max filter
a3 = g;
for i = 1:x
    for j = 1:y
        q = 1;
        
        for k = i:(i+n-1)
           % r = 1;
            for l = j:(j+n-1)
                filter(1, q) = g(k, l);
                
                %r = r + 1;
                q = q + 1;
            end
            %q = q + 1;
        end
        %disp(filter);
        a3(i+1, j+1) = max(filter);
    end
end





subplot(3,3,1);
imshow(b0);
title('Original Image 1');


subplot(3,3,2);
imshow(b1);
title('Box Filtered Image');


subplot(3,3,3);
imshow(b2);
title('Weighted filtered Image');



subplot(3,3,4);
imshow(f);
title('Original Image 2');


subplot(3,3,5);
imshow(a1);
title('Median Filtered Image');

subplot(3,3,6);
imshow(a3);
title('Max filtered Image');

subplot(3,3,7);
imshow(a2);
title('Min Filtered Image');

