%% Program to take an audio file as inputand use it.
clc;
clearvars;
close all;

%% Add path where the audio file is located
addpath ('D:\Tutorial\Footstep_classification\Data\NoiseFiles\chirp_noise');

%% Read the audio file and store it in a variable
path = 'D:\Tutorial\Footstep_classification\Data\NoiseFiles\chirp_noise\';
fname = 'chirp-1.wav';
inputFileName = char(strcat(path, fname)); %Sounds\
[ipSound,Fs] = audioread( inputFileName,'native');
%% Plot the audio signal
L=length(ipSound); % Total number of samples present in the audio clip

figure(1);
tvec=(0:L-1)/Fs;
plot(tvec,ipSound(:,1)); % for channel 1 of the stereo microphone
xlabel('time(s)');
ylabel('magnitude');

figure(2);
stem(ipSound(:,1)); % for channel 1 of the stereo microphone
% stem(ipSound(:,2)); % for channel 2 of the stereo microphone
xlabel('sample number');
ylabel('magnitude');

%% Frequency spectrum (FFT) of the sound signal
% Fs = 44100;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 220500;             % Length of signal
% L=1024;
t = (0:L-1)*T;        % Time vector

X = ipSound; % input signal samples
Y = fft(X); % using inbuilt fft function
% Y = fft(X,L);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure(3);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% Downsample the signal

sampling_factor = 4;
Fs_new = Fs/sampling_factor; 

ipSound_downsampled = downsample(ipSound, sampling_factor);

%% Plot the downsampled audio signal
L=length(ipSound_downsampled); % Total number of samples present in the audio clip

figure(3);
tvec=(0:L-1)/Fs_new;
plot(tvec,ipSound_downsampled(:,1)); % for channel 1 of the stereo microphone
xlabel('time(s)');
ylabel('magnitude');

figure(4);
stem(ipSound_downsampled(:,1)); % for channel 1 of the stereo microphone
% stem(ipSound(:,2)); % for channel 2 of the stereo microphone
xlabel('sample number');
ylabel('magnitude');
%% Frequency spectrum (FFT) of the sound signal

% Fs = 44100;            % Sampling frequency                    
T = 1/Fs_new;             % Sampling period       
L = length(ipSound_downsampled);             % Length of signal
% L=1024;
t = (0:L-1)*T;        % Time vector

X = ipSound_downsampled; % input signal samples
% Y = fft(X); % using inbuilt fft function

L = 65536;
Y = fft(X,L);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs_new*(0:(L/2))/L;

figure(5);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%% Bin averaging to reduce Feature vector dimension

bin_width=512;
%bin_width=1024;
%bin_width=2048;
%bin_width=2^11;
%bin_width=2^12;
%bin_width=2^13;
%bin_width=2^14;
  
bins=floor(length(P1)/bin_width);

        st=1;
        en=st+(bin_width-1);
            
        for i=1:1:bins
            avg_bin=sum(P1(st:en))/bin_width;
            FV(1,i)=avg_bin;
            st=en+1;
            en=st+(bin_width-1);
        end
figure(6);

