%...............Author Name-Farhana pravin.........
%...............Date-April/9/2014...........
%..........Discription-FFT by DIT method.......
close all;
clear all;
clc;
[x,fs]=audioread('one.wav')
N=length(x);
disp(size(x))
disp(nextpow2(N))
t=2^nextpow2(N);
disp(t)
new_l=t-N;
disp(new_l)
if log2(N)~=nextpow2(N)
    x =padarray(x, [new_l, 0], 0, 'post');
end
disp(length(x))
N=length(x)
a=zeros(1,N);
z=zeros(1,N);
y=[1:N];
p=bitrevorder(y);
t=expm(-i*2*pi/N);
for i=1:N
b=p(i);
a(b)=x(i);
end
for m=1:log2(N)
    k=0:(2^(m-1))-1;
    j=1;
    i=1;
    for q=1:N/2
        z(i)=a(i)+a(i+2^(m-1))*t^k(j);
        z(i+2^(m-1))=a(i)-a(i+2^(m-1))*t^k(j);
        j=j+1;
        
        if(mod(i,2^(m-1))==0)
            i=i+2^(m-1)+1;
            j=1;
        else
            i=i+1;
        end
            
    end
    a=z;
end
a
Xmag=abs(a);
N=length(a);
frequencies = (0:N-1) * fs / N;
plot(frequencies,Xmag);