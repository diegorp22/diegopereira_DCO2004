clear all;clc;close all;                      % Limpa vari�veis e fecha todos os gr�ficos
tf = 0.3;                                     % Dura��o de cada tom
% Dicon�rio de notas musicais
% Do = 1; R� = 2; Mi = 3; F� = 4; Sol = 5; L� = 6; Si = 7; Sil�ncio = 0
% Vetor de "m�sica", usando o dicion�rio de notas pr�-definido
vtmusic = [1 2 3 4 0 4 4 0 1 2 1 2 0 2 2 0 1 5 4 3 0 3 3 0 1 2 3 4 0 4 4];
fdo = 512;                                    % Frequ�ncia da nota D� (Hz)
vtTom2Freq = [1 9/8 5/4 4/3 3/2 5/3 15/8 2];  % Rela��o de frequ�ncias entre as notas musicais
for iplay = vtmusic                           % Loop de gera��o e reprodu��o da m�sica 
    if iplay == 0                             % Implementa��o do sil�ncio
        pause(tf);
    else
        fs = vtTom2Freq(iplay)*fdo;           % Escolhe a frequ�ncia do tom corrente
        fa = 100*fs;                          % Escolhe a frequ�ncia de amostragem do tom corrente
        t = 0:1/fa:tf;                        % Gera o eixo do tempo para o tom corrente
        y=cos(2*pi*fs*t)+0.8*cos(2*pi*0.01*fs*t)+0.8*cos(-2*pi*0.01*fs*t);
        %wavplay(y,fa)                        % Matlab antigo: Os �ltimos comandos poderiam ser trocados por essa linha
        p = audioplayer(y, fa);               % Reproduzir o sinal gerado  
        play(p);                              % Reproduzir o sinal gerado
        pause(tf);                            % Pausa com a dura��o do som a ser escutado (antes de tocar o pr�ximo tom)
    end
end