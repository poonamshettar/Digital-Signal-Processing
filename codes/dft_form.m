% Replace 'your_audio_file.wav' with the path to your WAV file
wav_file = 'one.wav';

% Read the WAV file
[y, Fs] = audioread(wav_file);

% Number of samples in the audio signal
N = length(y);

% Initialize arrays to store the real and imaginary parts of the DFT
realDFT = zeros(1, N);
imagDFT = zeros(1, N);
pre_operation_memory = memory; 
tic
% Calculate the DFT
for k = 1:N
    for n = 1:N
        % Compute the DFT terms using the formula
        angle = 2 * pi * (k-1) * (n-1) / N;
        realDFT(k) = realDFT(k) + y(n) * cos(angle);
        imagDFT(k) = imagDFT(k) - y(n) * sin(angle);
    end
end
toc
post_operation_memory = memory; 
% Calculate the magnitude of the DFT
magnitudeDFT = sqrt(realDFT.^2 + imagDFT.^2);

% Calculate the corresponding frequencies
frequencies = (0:N-1) * Fs / N;

% Plot the magnitude of the DFT
figure;
plot(frequencies, magnitudeDFT);
title('DFT of Audio Signal (Algorithmic Approach)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
fprintf('Memory before the operation: %.2f MB\n', pre_operation_memory.MemUsedMATLAB / 1e6);
fprintf('Memory after the operation: %.2f MB\n', post_operation_memory.MemUsedMATLAB / 1e6);
% You can adjust the x-axis limits to zoom in on a specific range, e.g., xlim([0, Fs/2]);

% Display the plot
whos
