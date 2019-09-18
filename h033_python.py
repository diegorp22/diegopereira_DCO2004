from matplotlib import pyplot as plt 
import numpy as np
import scipy.io.wavfile as wv 

#importando e armazenando o arquivo de áudio numa variável
FlautaFile = wv.read('Flauta.wav')
ViolinoFile = wv.read('Violino.wav')

fs1 = FlautaFile[0]                      #frequência de amostragem (Hz)

T = 1/fs1;               #% Sampling period       
L1 = len(FlautaFile[1]);   #% Length of signal
#t1 = np.arrange(0,L1-1)*T;         #% Time vector
L2 = len(ViolinoFile[1]);  #% Length of signal
#t2 = np.arrange(0,L2-1)*T;         #% Time vector

Y1 = np.fft.fft(FlautaFile[1]);
Y2 = np.fft.fft(ViolinoFile[1]);
          
Na  = len(FlautaFile[1])                #número de amostras 
Na1 = 4*Na                              #número de pontos da fft

f  = np.arange(0,Na1)*fs1/Na1;           #definição do eixo da frequência

             
plt.figure(1,[8,5])

#Sinal sem janela (retangular)
plt.subplot(211)
plt.plot(f[:Na1//2],20.0*np.log10(Y1[:Na1//2]/max(Y1)))
plt.axis([f[0],f[Na1//2],-300,0])
plt.grid()
plt.title("Espectro da Flauta")
plt.ylabel("Amplitude (dB)")