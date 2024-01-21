% Butterworth filter design parameters
kp = -1;
ks = -20;
p = 4;
s = 8;

% Calculate filter order (n)
p_ = p / p;
s_ = s / p;
n = log((10^(-0.1 * kp) - 1) / (10^(-0.1 * ks) - 1)) / (2 * log(p_ / s_));
n = ceil(n);

% Poles calculation
theta = zeros(1, n);
pole = zeros(1, n);

for k = 0:n-1
    theta(k+1) = (pi * k / n) + (pi / (2 * n)) + (pi / 2);
    pole(k+1) = cos(theta(k+1)) + 1i * (sin(theta(k+1)));
end

disp('Poles:');
disp(pole);

% Cutoff frequency calculation
c = p / (((10^(-0.1 * kp)) - 1) ^ (1 / (2 * n)));

disp('Cutoff frequency:');
disp(c);

% Audio filter implementation
% Load audio file
audioFile = 'C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\one.wav'; % Provide the path to your audio file
[inputAudio, fs] = audioread(audioFile);

% Apply filter to audio signal
outputAudio = zeros(size(inputAudio));

for i = 1:length(inputAudio)
    % Process each sample through the custom filter
    outputAudio(i) = real(custom_filter(inputAudio(i), pole));
end

% Plot the original and filtered signals
time = (0:length(inputAudio)-1) / fs;

figure;
subplot(2, 1, 1);
plot(time, inputAudio);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(time, outputAudio);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Play the filtered audio
%sound(inputAudio,fs)
sound(outputAudio, fs);

% Function to apply the filter to a single sample
function y = custom_filter(x, pole)
    y = 0;
    for k = 1:length(pole)
        y = y + 1 / (1 - pole(k)) * x;
    end
end
