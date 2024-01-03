[x,fs]=audioread('one.wav');
disp(size(x))
N=length(x);
%disp(N)
disp(nextpow2(N))
t=2^nextpow2(N);
disp(t)
new_l=t-N;
disp(new_l)
tic
if log2(N)~=nextpow2(N)
    x =padarray(x, [new_l, 0], 0, 'post');
end
%disp(x)
length(x)

    % Bit-reverse ordering of input sequence
    x = bitrevorder(x);

    % FFT stages
    for s = 1:log2(N)
        m = 2^s; % Stage size
        Wm = exp(-2i * pi / m);

        for k = 1:m:N
            W = 1;
            for j = 0:(m/2 - 1)
                i = k + j;
                A = x(i);
                B = x(i + m/2);
                x(i) = A + W * B;
                x(i + m/2) = A - W * B;
                W = W * Wm;
            end
        end
    end
    X=x;
toc;
disp(X(1))
Xmag=abs(X);
N=length(X);
frequencies = (0:N-1) * fs / N;
plot(frequencies,Xmag);