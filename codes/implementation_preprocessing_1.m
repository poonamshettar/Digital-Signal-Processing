[x,fs]=audioread('one.wav');
t = (0:length(x)-1) / fs;
plot(t,x)
order = 4; % Order of the filter
passband = [100, 10000]; % Passband frequencies in Hz
[b, a] = butter(order, passband/(fs/2), 'bandpass');

% Apply the Butterworth filter to the audio signal
filtered_signal = filter(b, a, x);

% Plot the original and filtered signals
t = (0:length(x)-1) / fs;

figure;
%subplot(2,1,1);
plot(t, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

%subplot(2,1,2);
plot(t, filtered_signal);
title('Filtered Audio Signal (Butterworth Band-Pass 100-10000 Hz)');
xlabel('Time (seconds)');
ylabel('Amplitude');

fft(filtered_signal)


threshold = 0.1;

% Apply the noise gate
filtered_signal = x;
filtered_signal(abs(x) < threshold) = 0;

% Plot the original and filtered signals
t = (0:length(x)-1) / fs;

figure;
subplot(2,1,1);
plot(t, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_signal);
title('Filtered Audio Signal (Noise Gate)');
xlabel('Time (seconds)');
ylabel('Amplitude');

reference_amplitude = 1.0;
x_dB = 20 * log10(abs(x) / reference_amplitude);

% Set the dB threshold for noise removal
threshold_dB = -150;

% Apply the noise gate
x_filtered = x;
x_filtered(x_dB < threshold_dB) = 0;

% Plot the original and filtered signals
t = (0:length(x)-1) / fs;

figure;
subplot(2,1,1);
plot(t, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, x_filtered);
title(['Filtered Audio Signal (Remove Signals Below ' num2str(threshold_dB) ' dB)']);
xlabel('Time (seconds)');
ylabel('Amplitude');

x_normalized = filtered_signal / max(abs(filtered_signal));

% Plot the original and normalized signals
t = (0:length(x)-1) / fs;

figure;
subplot(2,1,1);
plot(t, x);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, x_normalized);
title('Normalized Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');