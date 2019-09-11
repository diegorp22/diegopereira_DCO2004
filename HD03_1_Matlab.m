close all;clc;clear all;                     % Limpa variáveis e fecha todos os gráficos
FlautaFile = ['Flauta.wav'];                 % Especifica do local e nome do arquivo de áudio
ViolinoFile = ['Violino.wav'];               % Especifica do local e nome do arquivo de áudio

[vtFlauta,  fs1] = audioread(FlautaFile);    % Abre arquivo de áudio de um arquivo
[vtViolino, fs2] = audioread(ViolinoFile);   % Abre arquivo de áudio de um arquivo

%% FFT

T = 1/fs1;             % Sampling period       
L1 = length(vtFlauta);  % Length of signal
t1 = (0:L1-1)*T;         % Time vector
L2 = length(vtViolino);  % Length of signal
t2 = (0:L2-1)*T;         % Time vector

Y1 = fft(vtFlauta);
Y2 = fft(vtViolino);

%Flauta
Pa1 = abs(Y1/L1);
Pb1 = Pa1(1:L1/2+1);
Pb1(2:end-1) = 2*Pb1(2:end-1);

f1 = fs1*(0:(L1/2))/L1;

%Violino
Pa2 = abs(Y2/L2);
Pb2 = Pa2(1:L2/2+1);
Pb2(2:end-1) = 2*Pb2(2:end-1);

f2 = fs2*(0:(L2/2))/L2;

%Plot
subplot(2,1,1);
plot(f1,Pb1)
title('Espectro da Flauta')
grid;
xlabel('Frequência, Hz')
ylabel('Magnitude')

subplot(2,1,2);
plot(f2,Pb2)
title('Espectro do Violino')
grid;
xlabel('Frequência, Hz')
ylabel('Magnitude')
