<h1>Juego clásico Pong:</h1>

<p>El siguiente proyecto consiste en la recreación del clásico juego de Pong. Se ha utilizado para su desarrollo el lenguaje Processing en su entorno de desarrollo en la versión 3.5.4.</p>

<p>También se ha hecho uso de las librerías Sound en su versión 2.2.3, y de la librería GifAnimation 3.0. Esta última librería se instaló manualmente descargándola de la dirección "https://github.com/extrapixel/gif-animation".</p>

<p>Adicionalmente, se ha añadido al proyecto tres ficheros de sonido wav para los efectoe de rebote de la bola, aplausos tras un gol, y fanfarria final al ganar la partida. Los sonidos se obtuvieron de la página web "https://freewavesamples.com/".</p>

<p>
Concretamente se utilizaron los ficheros:
<ul>
<li>rebote.wav -> "https://freewavesamples.com/e-mu-proteus-fx-javanese-c3" - E-Mu-Proteus-FX-Javanese-C3.wav</li>
<li>aplauso.wav -> "https://freewavesamples.com/applause" - Applause.wav</li>
<li>fanfarria.wav -> "https://freewavesamples.com/yamaha-pss-170-fireworks-c3" - Yamaha-PSS-170-Fireworks-C3.wav</li>
</ul>
</p>

<p>La funcionalidad de generación del gif se ha dejado en el proyecto pero desactivada. Para activarla simplemente hay que descomentar las líneas actualmente comentadas. Se ha decidido hacer así debido a que el proceso de generación del gif ralentiza en exceso la ejecución del juego. Debido a esto último, para la generación del gif he decidido capturar únicamente uno de cada tres fotogramas, de modo que la
velocidad del gif se asemeje a la velocidad real del juego.</p>

![Gif Pong](./pong1.gif "Pong")

<p>De modo adicional se ha eleborado un vídeo en el que se puede ver de forma más realista la ejecución del programa. La reproducción del vídeo no incluye sonido.</p>

<a href="./pong.mp4" title="Video Pong"><img src="pong.mp4" alt="Pong" /></a>

<p>En el programa se ha reproducido el comportamiento en los rebotes contra los muros del juego original. Es decir, cuando la bola toca el muro por la parte frontal la dirección de salida de la bola dependerá de la posición relativa del choque. Si la bola golpea el muro por la parte central la bola será rebotada de modo horizontal, mientras que si golpea por las partes laterales la bola adquirirá un ángulo proporcional a la distancia del centro del muro.</p>

<p>Esta aplicación se ha desarrollado como primera práctica evaluable para la asignatura de "Creando Interfaces de Usuarios" de la mención de Computación del grado de Ingeniería Informática de la Universidad de Las Palmas de Gran Canaria en el curso 2019/20 y en fecha de 10/2/2020 por el alumno Juan Sebastián Ramírez Artiles.</p>
