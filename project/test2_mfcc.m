N = 256;                        % frame size
M = 100;                        % inter frame distance
[s,fs]=audioread('original.wav');
len = length(s);
numberOfFrames = 1 + floor((len - N)/double(M));
numberOfFrames
mat = zeros(N, numberOfFrames); % vector of frame vectors
for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:N
        mat(j,i) = s(index);
        index = index + 1;
    end
end

hamW = hamming(N);              % hamming window
afterWinMat = diag(hamW)*mat;   
freqDomMat = fft(afterWinMat);  % FFT into freq domain

filterBankMat = melFilterBank(13, N, fs);                % matrix for a mel-spaced filterbank
nby2 = 1 + floor(N/2);
ms = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; % mel spectrum
c = dct(log(ms));                                % mel-frequency cepstrum coefficients
c(1,:) = [];  
c;
figure;
imagesc(c);
xlabel('Frame');
ylabel('Cepstrum Coefficients');
title('Mel-frequency Cepstrum Coefficients (MFCCs) vs Frames');
colorbar;