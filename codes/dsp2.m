% Define the file path for your input audio file
inputFilePath = 'one.wav';

% Read the input audio file
[inputAudio, sampleRate] = audioread(inputFilePath);

% Number of samples in the audio signal
N = length(inputAudio);

% Initialize an array to store the DFT results
X = zeros(1, N);

% Compute the DFT using the formula
for k = 1:N
    X(k) = 0;
    for n = 1:N
        X(k) = X(k) + inputAudio(n) * exp(-1j * 2 * pi * (k-1) * (n-1) / N);
    end
end

% Calculate the magnitude of the DFT (the spectrum)
magnitude = abs(X);

% Calculate the frequency values corresponding to the DFT bins
frequencies = (0:N-1) * sampleRate / N;

% Plot the magnitude spectrum
figure;
plot(frequencies, magnitude);
title('DFT of Audio Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Optional: Zoom in on a specific frequency range
% You can set appropriate limits for the x-axis to focus on specific frequencies.
% xlim([0, 5000]);  % Adjust the frequency range as needed

% Optional: Calculate the phase spectrum
% phase = angle(X);

% Optional: Inverse DFT to get the original signal (if needed)
% inverse_signal = ifft(X);

% Optional: Play the original audio
% sound(inputAudio, sampleRate);
