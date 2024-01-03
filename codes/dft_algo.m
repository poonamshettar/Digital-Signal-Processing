% Load an audio file
file_path = 'one.wav';
[x, Fs] = audioread(file_path);

% Perform FFT
X = fft(x);

% Calculate the frequency axis
f = linspace(-Fs/2, Fs/2, length(X));

% Plot the magnitude spectrum
figure;
plot(f, fftshift(abs(X)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of Audio Signal');

% Optionally, zoom into a specific frequency range if needed
% xlim([0, 2000]); % Adjust the limits as needed
