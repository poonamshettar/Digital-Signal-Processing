[x,fs]=audioread('one.wav');
dft=fft(x);
figure;
N = length(x);
frequencies = (0:N-1) * fs/ N;
plot(frequencies, abs(dft));
title('DFT of Audio Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');