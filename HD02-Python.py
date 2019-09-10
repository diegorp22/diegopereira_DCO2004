import numpy as np           #importando as bibliotecas necessárias:
import matplotlib.pyplot as plt 
import scipy.io.wavfile as wv 
import os

                             # Parâmetros da onda:
tf = 1                       # Tempo de duração da nota
fc = 512                     # Frequência da nota Dó
fs = 100*fc                  # Frequencia de amostragem da nota. 
t =np.arange(0,tf+1/fs,1/fs) # Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1                        # Amplitude do sinal
#y=A*np.cos(2*np.pi*fc*t)     # Sinal senoidal

y0=A*np.cos(2*np.pi*fc*t)
y1=A*np.cos(2*(9/8)*np.pi*fc*t)
y2=A*np.cos(2*(5/4)*np.pi*fc*t)
y3=A*np.cos(2*(4/3)*np.pi*fc*t)
y4=A*np.cos(2*(3/2)*np.pi*fc*t)
y5=A*np.cos(2*(5/3)*np.pi*fc*t)
y6=A*np.cos(2*(2/1)*np.pi*fc*t)

plt.figure(1,figsize=[10,7]) # cria instância da figura para poder alterar seu tamanho
plt.plot(t,y0)                # Visualizar o sinal gerado  
plt.plot(t,y1)                # Visualizar o sinal gerado  
plt.plot(t,y2)                # Visualizar o sinal gerado  
plt.plot(t,y3)                # Visualizar o sinal gerado  
plt.plot(t,y4)                # Visualizar o sinal gerado  
plt.plot(t,y5)                # Visualizar o sinal gerado  
plt.plot(t,y6)                # Visualizar o sinal gerado  
plt.axis([0,0.002,-2,2])      # Zoom para melhor visualização  
plt.legend(['Dó','Ré','Mi', 'Fá','Sol','Lá', 'Sí'])
plt.show() 

#importando e armazenando o arquivo de áudio numa variável
som = wv.read('sound_01.wav')

#salvando o tom gerado em um arquivo de extensão .wav :
wv.write('tom_gerado.wav',fs,y0)
#reproduzindo o arquivo

os.system('cvlc --play-and-exit tom_gerado.wav') 
#vlc chama o programa VLC Audio Player
#'c' serve para que nenhuma interface seja aberta
