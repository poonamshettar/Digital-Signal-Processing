[u,fs]=audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\one.wav');
[v,fs]=audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\one.wav');
[w,fs]=audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\three.wav');
[x,fs]=audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\four.wav');
[y,fs]=audioread('C:\Users\Lenovo\Documents\MATLAB\DSP\Digital-Signal-Processing\audio_files\five.wav');
c1=final_mfcc(u,fs);
c2=final_mfcc(v,fs);
c3=final_mfcc(w,fs);
c4=final_mfcc(x,fs);
c5=final_mfcc(y,fs);
dist1=distance_(c1,c2);
dist2=distance_(c1,c3);
dist3=distance_(c1,c4);
dist4=distance_(c1,c5);
if dist1 < 100
    disp('Matched for distance 1');
    soundsc(v, fs); % Play sound associated with dist1
elseif dist2 < 100
    disp('Matched for distance 2');
    soundsc(w, fs); % Play sound associated with dist2
elseif dist3 < 100
    disp('Matched for distance 3');
    soundsc(x, fs); % Play sound associated with dist3
elseif dist4 < 100
    disp('Matched for distance 4');
    soundsc(y, fs); % Play sound associated with dist4
else
    disp('No match found');
end
