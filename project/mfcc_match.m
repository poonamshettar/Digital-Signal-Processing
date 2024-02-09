% Load the audio signals
[sound1, Fs1] = audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\s1.wav');
[sound2, Fs2] = audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\s1.wav');

% Extract MFCC coefficients for the first audio signal
mfcc_coeffs1 = mfcc(sound1, Fs1);

% Extract MFCC coefficients for the second audio signal
mfcc_coeffs2 = mfcc(sound2, Fs2);
%{
sound1=sound1';
sound1=sound1(1,:);
sound1=sound1';
sound2=sound2';
sound2=sound2(1,:);
sound2=sound2';
mfcc_coeffs1=mfcc_coeffs1';
mfcc_coeffs1=mfcc_coeffs1(1,:);
mfcc_coeffs1=mfcc_coeffs1';
mfcc_coeffs2=mfcc_coeffs2';
mfcc_coeffs2=mfcc_coeffs2(1,:);
mfcc_coeffs2=mfcc_coeffs2';
%}
size(mfcc_coeffs1)
% Compute the cross-correlation between the MFCC coefficients
[correlation, lag] = xcorr(mfcc_coeffs1, mfcc_coeffs2);

% Plot the cross-correlation
figure;
plot(lag, correlation);
xlabel('Lag');
ylabel('Cross-correlation');
title('Cross-correlation of MFCC coefficients between audio signals');
grid on;
