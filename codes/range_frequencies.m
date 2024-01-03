% Read an audio file
filename = 'one.wav';  % replace with the path to your audio file
[y, Fs] = audioread(filename);

% Calculate the time vector
t = (0:length(y)-1) / Fs;

% Plot the waveform
subplot(2, 1, 1);
plot(t, y);
title('Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Plot the frequency spectrum
subplot(2, 1, 2);
N = length(y);
frequencies = linspace(0, Fs/2, N/2 + 1);
Y = fft(y);
magnitude = abs(Y(1:N/2+1));

plot(frequencies, magnitude);
title('Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Display only positive frequencies
xlim([0, Fs/2]);

% Show grid
grid on;

% Print the range of frequencies
min_frequency = min(frequencies);
max_frequency = max(frequencies);
fprintf('Frequency Range: %.2f Hz to %.2f Hz\n', min_frequency, max_frequency);

% Adjust layout
sgtitle('Audio Signal and Frequency Spectrum');

% Optionally, you can save the figure
% saveas(gcf, 'audio_spectrum.png');
