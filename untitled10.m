close all;clc;clear all;                     % Limpa variáveis e fecha todos os gráficos
FlautaFile = ['Flauta.wav'];                 % Especifica do local e nome do arquivo de áudio
ViolinoFile = ['Violino.wav'];               % Especifica do local e nome do arquivo de áudio

[vtFlauta,  fs1] = audioread(FlautaFile);    % Abre arquivo de áudio de um arquivo
[vtViolino, fs2] = audioread(ViolinoFile);   % Abre arquivo de áudio de um arquivo

%% FFT
fs=fs1;                      % Frequência de amostragem em kHz

N1=length(vtFlauta);         % Número de amostras
N1=4*N1;                     % Número de pontos da fft

N2=length(vtViolino);        % Número de amostras
N2=4*N2;                     % Número de pontos da fft

f1=(0:N1-1)*fs/N1;           % Definição do eixo da frequência [axis]
f2=(0:N2-1)*fs/N2;           % Definição do eixo da frequência [axis]

Xf=abs(fft(vtFlauta,N1));    % Encontra a magnitude da FFT usando janela retangular (sem janela)
Xv=abs(fft(vtViolino,N2));   % Encontra a magnitude da FFT usando janela retangular (sem janela)
%% Plot
% Flauta
subplot(2,1,1);
plot(f1(1:N1/2),20*log10(Xf(1:N1/2)/max(Xf)));
title('Espectro da Flauta');
grid;
xlabel('Frequência, kHz');
ylabel('Magnitude, [dB]');
axis([f1(1) f1(N1/2) -300 0]);

% Violino
subplot(2,1,2);
plot(f2(1:N2/2),20*log10(Xv(1:N2/2)/max(Xv)));
title('Espectro do Violino');
grid;
xlabel('Frequência, kHz');
ylabel('Magnitude, [dB]');
axis([f2(1) f2(N2/2) -300 0]);
