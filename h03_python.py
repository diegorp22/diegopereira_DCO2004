from matplotlib import pyplot as plt 
import numpy as np
import scipy.io.wavfile as wv 

#importando e armazenando o arquivo de áudio numa variável
FlautaFile = wv.read('Flauta.wav')
ViolinoFile = wv.read('Violino.wav')

fs = FlautaFile[0]                      #frequência de amostragem (Hz)

Na  = len(FlautaFile[1])                #número de amostras 
Na1 = 4*Na                              #número de pontos da fft

Nb  = len(ViolinoFile[1])                #número de amostras 
Nb1 = 4*Nb                              #número de pontos da fft

na  = np.arange(0,Na)                   #index n
f  = np.arange(0,Na1)*fs/Na1;           #definição do eixo da frequência
r = np.ones(Na)                         #janela retangular

nb  = np.arange(0,Nb)                   #index n
f  = np.arange(0,Nb1)*fs/Nb1;           #definição do eixo da frequência
r = np.ones(Nb)                         #janela retangular
           
XF = np.fft.fft(FlautaFile[1],Na1)      #fft
XF = np.abs(XF)/Na1                     #normalização

XV = np.fft.fft(ViolinoFile[1],Nb1)      #fft
XV = np.abs(XV)/Nb1                     #normalização
           
plt.figure(1,[8,5])

#Sinal sem janela (retangular)
plt.subplot(211)
plt.plot(f[:Na1//2],20.0*np.log10(XF[:Na1//2]/max(XF)))
plt.axis([f[0],f[Na1//2],-300,0])
plt.grid()
plt.title("Espectro da Flauta")
plt.ylabel("Amplitude (dB)")

plt.subplot(212)
plt.plot(f[:Nb1//2],20.0*np.log10(XV[:Nb1//2]/max(XV)))
plt.axis([f[0],f[Nb1//2],-300,0])
plt.grid()
plt.title("Espectro do Violino")
plt.ylabel("Amplitude (dB)")

plt.tight_layout()
plt.show()