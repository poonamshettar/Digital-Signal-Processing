function c=final_mfcc(speechSignal,fs)
frameSize = 256;
overlap = 128;
numFrames = floor((length(speechSignal) - overlap) / (frameSize - overlap))
framesMatrix = zeros(numFrames, frameSize);
N=frameSize
n=0:N-1
W=0.54-0.46*cos(2*pi*n/(N-1));

for i = 1:numFrames
    startIdx = (i - 1) * (frameSize - overlap) + 1;
    endIdx = startIdx + frameSize - 1;
    frame = speechSignal(startIdx:endIdx);
    
    if length(frame) < frameSize
        frame = [frame; zeros(frameSize - length(frame), 1)];
    end
    framesMatrix(i, :) = frame;
    x=framesMatrix(i,:);
    windowed(i,:)=x.*W;
    transform(i,:)=abs(fft(windowed(i,:),256));
end

size(windowed)
size(transform)
transform(1,:)
framesMatrix(50,:)
length(framesMatrix)

N=256
filterBankMat = melFilterBank(20, N, fs);                % matrix for a mel-spaced filterbank
nby2 = 1 + floor(N/2);
ms = filterBankMat*abs(transform(1:nby2,:)).^2; % mel spectrum
c = dct(log(ms));                                % mel-frequency cepstrum coefficients
c(1,:) = [];   
c=c(1:13,:);
%{
figure;
imagesc(c);
xlabel('Frame');
ylabel('Cepstrum Coefficients');
title('Mel-frequency Cepstrum Coefficients (MFCCs) vs Frames');
colorbar;
%}