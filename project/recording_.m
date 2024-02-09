duration = 3;           % Recording duration in seconds
fs = 44100;             % Sampling rate

% Create an audiorecorder object
recObj = audiorecorder(fs, 16, 1); % 16 bits per sample, mono

% Record audio
disp('Start speaking.');
recordblocking(recObj, duration);
disp('End of recording.');

% Retrieve the recorded audio data
audioData = getaudiodata(recObj);
filename = 'recorded_audio.wav';
audiowrite(filename, audioData, fs);
% Play the recorded audio
soundsc(audioData, fs);