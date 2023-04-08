clc;
[y,Fs] = audioread('Signal_02.wav');
%info = audioinfo('Signal_02.wav');
%% Unfiltered Signal in Time Domain
t = linspace(0,length(y)/Fs,length(y));
figure;
subplot(2,2,1)
plot(t,y)
title('Unfiltered Signal in Time domain');
xlabel('Time');
ylabel('Magnitude');
%% Filtered Signal in Time Domain
Hd1 = filter(Hd,y);
fst = fft(Hd1);
subplot(2,2,3)
plot(t,Hd1)
title('Filtered Signal in Time domain');
xlabel('Time');
ylabel('Magnitude');
sound(Hd1,Fs)
%% Unfiltered Signal in Frequency Domain
Y1 = fft(y);
Y1 = fftshift(Y1);
n = length(y);
fshift = (-n/2:n/2-1)*(Fs/n);
subplot(2,2,2)
plot(fshift,abs(Y1))
title('Unfiltered Signal in Frequency domain');
xlabel('Frequency');
ylabel('Magnitude');
%% Filtered Signal in Frequency Domain
Y2 = fft(Hd1);
Y2 = fftshift(Y2);
subplot(2,2,4)
plot(fshift,abs(Y2))
title('Filtered Signal in Frequency domain');
xlabel('Frequency');
ylabel('Magnitude');
