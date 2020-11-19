from collections import defaultdict, Counter
from re import sub
import matplotlib.pyplot as plt
import numpy as np
import re 

def Tokenize(doc):
    text = doc.read()
    doc.close()
    words = text.split(maxsplit=10000)
    return words
# Abrimos las notas y las separamos por tokens
buerak = open("Recursos/buerak.txt", encoding="utf-8")
words =Tokenize(buerak)

#Función para preprocesar las canciones quitando puntuación y convirtiendo la información en un solo formato
def clean_text(note_raw):
    notes = []
    for sen in range (0,len(note_raw)):
        nota = re.sub('[-,!?]', ' ', str(note_raw[sen])) #elimina los caracteres -,!?
        nota = re.sub(r'\s+', ' ', nota, flags=re.I) # elimina multiples espcios
        nota = nota.lower()# convierte el texto a minúsculas
        notes.append(nota) #añadimos la nota a la lista
        notes = list(filter(None,notes))
    return notes
# Realizamos un preprocesamiento del texto
words_ = clean_text(words)
# Realizamos un conteo de las palabras dentro del texto para analizar la frecuencia de cada una
corpus_buerak=Counter(words_)

# Ordena las diez palabras más comunes en orden descendiente
corpus_buerak.most_common(10)

from wordcloud import WordCloud  #Biblioteca
# Inicializamos un objeto WordCloud, se pueden establecer diversos parámetros para personalizar la nube
mycloud = WordCloud()   
# Le pasamos al objeto los datos para alimentar a la nube
mycloud.generate_from_frequencies(corpus_buerak)

import nltk                      #Biblioteca para tareas de PLN
from nltk.corpus import stopwords 
nltk.download('stopwords')


# Cargamos el diccionario de las palabras funcionales o stopwords rusas
russian_stopwords = stopwords.words("russian")
# Generamos un filtro para eliminar las palabras funcionales o stopwords
corpus_buerak_filtered={a: b for a, b in corpus_buerak.items() if a not in russian_stopwords}

# Generamos un nuevo objeto WordCloud con el nuevo diccionario sin palabras funcionales/stopwords:
cloud_filtered = WordCloud(width=1800, height=1000, background_color="white", colormap='brg')
cloud_filtered.generate_from_frequencies(corpus_buerak_filtered)

# Visualizamos nuestro objeto con ayuda de matplotlib
plt.figure(figsize=(18,10), dpi=800)
plt.imshow(cloud_filtered, interpolation="bilinear")
plt.axis("off")
plt.savefig('nube_buerak_filtered.png') #Si queremos guardar la imagen en el drive, aquí específicamos la ruta
plt.show() #Esta función muestra la imagen generada

from PIL import Image
# Cargamos la mascara de la palabra Buerak para visualizar de otra forma la nube de palabras
Buerak_mask = np.array(Image.open("Recursos/Buerak.png"))

wc = WordCloud(width=1800, height=1000,background_color="black", max_words=1000, mask=Buerak_mask,
               contour_width=1, contour_color='white', colormap='Set1')

wc.generate_from_frequencies(corpus_buerak_filtered)
# Se guarda la nube de palabras 
wc.to_file("Buerak_mask.png")
# Muestra la nube de palabras con la mascara de la palabra Buerak
plt.figure(figsize=[30,20], dpi=800)
plt.imshow(wc, interpolation='bilinear')
plt.axis("off")
plt.show()

