clear all;close all;      % Limpa vari�veis e fecha todos os gr�ficos
% Par�metros da onda
tf = 1;                   % Tempo de dura��o da nota
fc = 512;                 % Frequ�ncia da nota D�
fs = 100*fc;              % Frequ�ncia de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haver� um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(9/8)*pi*fc*t); % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % For�ar uma pausa com a dura��o do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualiza��o