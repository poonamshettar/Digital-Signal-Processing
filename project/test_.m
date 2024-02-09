[y,fs]=audioread("C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\one.wav")

length_of_signal=length(y)
pre_emphasised=zeros(size(y))
N=length_of_signal

filter_coeff=[1,-0.95];

for i=2:N
    pre_emphasised(i)=y(i)*filter_coeff(1)+y(i-1)*filter_coeff(2);
end
subplot(2,1,1);
plot(y)
xlabel('Time')
ylabel('Amplitude')
title('Original Audio Signal')
subplot(2,1,2);
plot(pre_emphasised)
xlabel('Time')
ylabel('Amplitude')
title('Pre-Emphasised Audio Signal')