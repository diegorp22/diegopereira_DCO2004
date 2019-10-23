% Parâmetros
EbN0_dB = [0, 5, 20];                                       % Eb/N0 de entrada

Ns = 10^5;                                                  % Número de símbolos simulados

M = [2 8];                                                 % Número de símbolo da modulação

% Sinal BPSK gerado pela função pskmod
bits2 = randi([0 M(1)-1],Ns,1);
txSig = pskmod(bits2,M(1));

rxSig1 = awgn(txSig,EbN0_dB(1));
rxSig2 = awgn(txSig,EbN0_dB(2));
rxSig3 = awgn(txSig,EbN0_dB(3));

% Sinal BPSK gerado pela função pskmod
bits8 = randi([0 M(2)-1],Ns,1);
txSig = pskmod(bits8,M(2));

rxSig4 = awgn(txSig,EbN0_dB(1));
rxSig5 = awgn(txSig,EbN0_dB(2));
rxSig6 = awgn(txSig,EbN0_dB(3));

% Gráficos
% BPSK
fig=figure;
subplot(2,3,1);
plot(rxSig1(find(real(rxSig1)>0)),'ro');
hold on;
plot(rxSig1(find(real(rxSig1)<=0)),'bs')
title('Eb/N0 = 0 - BPSK');
legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig1)' imag(rxSig1)']);
maxAx = max([real(rxSig1)' imag(rxSig1)']);
axis([minAx maxAx minAx maxAx]);

subplot(2,3,2);
plot(rxSig2(find(real(rxSig2)>0)),'ro');
hold on;
plot(rxSig2(find(real(rxSig2)<=0)),'bs')
title('Eb/N0 = 5 - BPSK');
legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig2)' imag(rxSig2)']);
maxAx = max([real(rxSig2)' imag(rxSig2)']);
axis([minAx maxAx minAx maxAx]);

subplot(2,3,3);
plot(rxSig3(find(real(rxSig3)>0)),'ro');
hold on;
plot(rxSig3(find(real(rxSig3)<=0)),'bs')
title('Eb/N0 = 20 - BPSK');
legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig3)' imag(rxSig3)']);
maxAx = max([real(rxSig3)' imag(rxSig3)']);
axis([minAx maxAx minAx maxAx]);


%8-PSK
subplot(2,3,4);
plot(rxSig4,'ro');
title('Eb/N0 = 0 - 8-PSK');
%legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig4)' imag(rxSig4)']);
maxAx = max([real(rxSig4)' imag(rxSig4)']);
axis([minAx maxAx minAx maxAx]);

subplot(2,3,5);
plot(rxSig5,'ro');
hold on;
%legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig5)' imag(rxSig5)']);
maxAx = max([real(rxSig5)' imag(rxSig5)']);
axis([minAx maxAx minAx maxAx]);


subplot(2,3,6);
plot(rxSig6,'ro');
title('Eb/N0 = 20 - 8-PSK');
%legend('Bit 1 transmitido','Bit 0 transmitido');
minAx = min([real(rxSig6)' imag(rxSig6)']);
maxAx = max([real(rxSig6)' imag(rxSig6)']);
axis([minAx maxAx minAx maxAx]);

fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 10 10];