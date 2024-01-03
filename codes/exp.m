% Load the WAV file
[y, Fs] = audioread('one.wav');


% Apply FFT
N = length(y);
fft_result = fft(y);
fft_result = abs(fft_result);

% Find the maximum frequency
[max_value, max_index] = max(fft_result);
max_frequency = (max_index - 1) * Fs / N;

fprintf('Maximum Frequency: %.2f Hz\n', max_frequency);
disp(Fs)