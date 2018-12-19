addpath(pwd);

current_path = [pwd '/']
list = dir([current_path '*.png'])

%rmdir(dest_path, 's');
dest_path = [pwd '/generated/']

%% Salt and Pepper Noise Addition with Uniform Noise Probablity Distribution
for k = 1:length(list)
    image = imread(list(k).name);
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1; % 10% of the pixels are made noisy
    upper_limit = 0.5;% 99% of the pixels are made noisy
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1); % Uniform Probablity between 10% and 99% noise levels
    noisy_image = imnoise(image,'salt & pepper', noise_density(k));
    mkdir([dest_path 'salt & pepper' '/']);
    imwrite(noisy_image,[dest_path 'salt & pepper' '/' name ext]);
end

%% Speckle Noise Addition 
for k = 1:length(list)
    image = imread(list(k).name);
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1;% variance is 0.1
    upper_limit = 0.5; %variance is 0.99
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1);% Uniform Probablity between 0.1 and 0.99 variance
    noisy_image = imnoise(image,'speckle', noise_density(k));
    mkdir([dest_path 'speckle' '/']);
    imwrite(noisy_image,[dest_path 'speckle' '/' name ext]);
end

%% Gaussian Noise Addition
for k = 1:length(list)
    image = imread(list(k).name);
    [~,name,ext] = fileparts(list(k).name);
    lower_limit_variance = 0.1;% variance is 0.1
    upper_limit_variance = 0.5;%variance is 0.99
    lower_limit_mean = 0;%mean is 0
    upper_limit_mean = 0.5;%mean is 0.5
    variance = lower_limit_variance + (upper_limit_variance - lower_limit_variance).* rand(length(list),1);%Uniformaly distributed variance between 0.1 and 0.99
    mean = lower_limit_mean + (upper_limit_mean - lower_limit_mean).*rand(length(list),1);%Uniformally distributed mean between 0 and 0.5
    noisy_image = imnoise(image,'gaussian',mean(k), variance(k));
    mkdir([dest_path 'gaussian' '/']);
    imwrite(noisy_image,[dest_path 'gaussian' '/' name ext]);
end

%% Salt and Pepper and Motion Blurring Combined
for k = 1:length(list)
    image = imread(list(k).name);
    theta = abs(0.*randn(length(list),1) + 75); %Normally distributed theta with mean 0 and Standard Deviation 75 degrees (You can change this to Uniform distribution to with rand function)
    len = abs(9.*randn(length(list),1) + 30);%Normally distributed pixel line length with mean 9 and Standard Deviation 30 degrees (You can change this to Uniform distribution to with rand function)
    h = fspecial('motion',len(k),theta(k));
    image = imfilter(image,h,'replicate');
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1; % 10% of the pixels are made noisy
    upper_limit = 0.5;% 99% of the pixels are made noisy
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1); % Uniform Probablity between 10% and 99% noise levels
    noisy_image = imnoise(image,'salt & pepper', noise_density(k));
    mkdir([dest_path 'salt & pepper_motion' '/']);
    imwrite(noisy_image,[dest_path 'salt & pepper_motion' '/' name ext]);
end

%% Speckle and Motion Blurring Combined
for k = 1:length(list)
    image = imread(list(k).name);
    theta = abs(0.*randn(length(list),1) + 75); %Normally distributed theta with mean 0 and Standard Deviation 75 degrees (You can change this to Uniform distribution to with rand function)
    len = abs(9.*randn(length(list),1) + 30);%Normally distributed pixel line length with mean 9 and Standard Deviation 30 degrees (You can change this to Uniform distribution to with rand function)
    h = fspecial('motion',len(k),theta(k));
    image = imfilter(image,h,'replicate');
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1;% variance is 0.1
    upper_limit = 0.5; %variance is 0.99
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1);% Uniform Probablity between 0.1 and 0.99 variance
    noisy_image = imnoise(image,'speckle', noise_density(k));
    mkdir([dest_path 'speckle_motion' '/']);
    imwrite(noisy_image,[dest_path 'speckle_motion' '/' name ext]);
end

%% Gaussian Noise and Motion Blurring Combined
for k = 1:length(list)
    image = imread(list(k).name);
    theta = abs(0.*randn(length(list),1) + 75); %Normally distributed theta with mean 0 and Standard Deviation 75 degrees (You can change this to Uniform distribution to with rand function)
    len = abs(9.*randn(length(list),1) + 30);%Normally distributed pixel line length with mean 9 and Standard Deviation 30 degrees (You can change this to Uniform distribution to with rand function)
    h = fspecial('motion',len(k),theta(k));
    image = imfilter(image,h,'replicate');
    [~,name,ext] = fileparts(list(k).name);
    lower_limit_variance = 0.1;% variance is 0.1
    upper_limit_variance = 0.5;%variance is 0.99
    lower_limit_mean = 0;%mean is 0
    upper_limit_mean = 0.5;%mean is 0.5
    variance = lower_limit_variance + (upper_limit_variance - lower_limit_variance).* rand(length(list),1);%Uniformaly distributed variance between 0.1 and 0.99
    mean = lower_limit_mean + (upper_limit_mean - lower_limit_mean).*rand(length(list),1);%Uniformally distributed mean between 0 and 0.5
    noisy_image = imnoise(image,'gaussian',mean(k), variance(k));
    mkdir([dest_path 'gaussian_motion' '/']);
    imwrite(noisy_image,[dest_path 'gaussian_motion' '/' name ext]);
end
%% Motion Blurring
for k = 1:length(list)
    image = imread(list(k).name);
    theta = abs(0.*randn(length(list),1) + 75); %Normally distributed theta with mean 0 and Standard Deviation 75 degrees (You can change this to Uniform distribution to with rand function)
    len = abs(9.*randn(length(list),1) + 30);%Normally distributed pixel line length with mean 9 and Standard Deviation 30 degrees (You can change this to Uniform distribution to with rand function)
    h = fspecial('motion',len(k),theta(k));
    blurred_image = imfilter(image,h,'replicate');
    [~,name,ext] = fileparts(list(k).name);
    mkdir([dest_path 'motion' '/']);
    imwrite(blurred_image,[dest_path 'motion' '/' name ext]);
end
%% All noises
for k = 1:length(list)
    image = imread(list(k).name);
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1; % 10% of the pixels are made noisy
    upper_limit = 0.5;% 99% of the pixels are made noisy
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1); % Uniform Probablity between 10% and 99% noise levels
    noisy_image = imnoise(image,'salt & pepper', noise_density(k));
    noisy_image_2 = imnoise(noisy_image,'speckle', noise_density(k));
    lower_limit_mean = 0;%mean is 0
    upper_limit_mean = 0.5;%mean is 0.5
    variance = lower_limit_variance + (upper_limit_variance - lower_limit_variance).* rand(length(list),1);%Uniformaly distributed variance between 0.1 and 0.99
    mean = lower_limit_mean + (upper_limit_mean - lower_limit_mean).*rand(length(list),1);%Uniformally distributed mean between 0 and 0.5
    noisy_image_3 = imnoise(noisy_image_2,'gaussian',mean(k), variance(k));
    mkdir([dest_path 'all_noises' '/']);
    imwrite(noisy_image,[dest_path 'all_noises' '/' name ext]);
end
%% All noises and blurness
for k = 1:length(list)
    image = imread(list(k).name);
    theta = abs(0.*randn(length(list),1) + 75); %Normally distributed theta with mean 0 and Standard Deviation 75 degrees (You can change this to Uniform distribution to with rand function)
    len = abs(9.*randn(length(list),1) + 30);%Normally distributed pixel line length with mean 9 and Standard Deviation 30 degrees (You can change this to Uniform distribution to with rand function)
    h = fspecial('motion',len(k),theta(k));
    image = imfilter(image,h,'replicate');
    [~,name,ext] = fileparts(list(k).name);
    lower_limit = 0.1; % 10% of the pixels are made noisy
    upper_limit = 0.5;% 99% of the pixels are made noisy
    noise_density = lower_limit + (upper_limit - lower_limit).* rand(length(list),1); % Uniform Probablity between 10% and 99% noise levels
    noisy_image = imnoise(image,'salt & pepper', noise_density(k));
    noisy_image_2 = imnoise(noisy_image,'speckle', noise_density(k));
    lower_limit_mean = 0;%mean is 0
    upper_limit_mean = 0.5;%mean is 0.5
    variance = lower_limit_variance + (upper_limit_variance - lower_limit_variance).* rand(length(list),1);%Uniformaly distributed variance between 0.1 and 0.99
    mean = lower_limit_mean + (upper_limit_mean - lower_limit_mean).*rand(length(list),1);%Uniformally distributed mean between 0 and 0.5
    noisy_image_3 = imnoise(noisy_image_2,'gaussian',mean(k), variance(k));
    mkdir([dest_path 'all_noises_and_blur' '/']);
    imwrite(noisy_image,[dest_path 'all_noises_and_blur' '/' name ext]);
end
%%
% For obtaining a Uniformally generated Random variable in the range [b,a]
% use the formula
%   random_number = a + (b - a).* rand(n,1) 
%   to generate a N x 1 uniformally distributed random vector in the range
%   [b,a]