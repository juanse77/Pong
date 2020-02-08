Juego cl�sico Pong:

	El siguiente proyecto consiste en la recreaci�n del cl�sico juego de Pong. Se ha utilizado para su desarrollo el lenguaje Processing en su entorno de desarrollo en la versi�n 3.5.4.

	Tambi�n se ha hecho uso de las librer�as Sound en su versi�n 2.2.3, y de la librer�a GifAnimation 3.0. Esta �ltima librer�a se instal� manualmente descarg�ndola de la direcci�n "https://github.com/extrapixel/gif-animation".

	Adicionalmente, se ha a�adido al proyecto tres ficheros de sonido wav para los efectoe de rebote de la bola, aplausos tras un gol, y fanfarria final al ganar la partida. Los sonidos se obtuvieron de la p�gina web "https://freewavesamples.com/".

	Concretamente se utilizaron los ficheros:
	rebote		->	"https://freewavesamples.com/e-mu-proteus-fx-javanese-c3" / E-Mu-Proteus-FX-Javanese-C3.wav
	aplauso		->	"https://freewavesamples.com/applause" / Applause.wav
	fanfarria	->	"https://freewavesamples.com/yamaha-pss-170-fireworks-c3" - Yamaha-PSS-170-Fireworks-C3.wav

	La funcionalidad de generaci�n del gif se ha dejado en el proyecto pero desactivada. Para activarla simplemente hay que descomentar las l�neas actualmente comentadas. Se ha decidido hacer as� debido a que el proceso de generaci�n del gif ralentiza en exceso la ejecuci�n del juego. Debido a esto �ltimo, para la generaci�n del gif he decidido capturar �nicamente uno de cada cuatro fotogramas, de modo que la velocidad del gif se asemeje a la velocidad real del juego.

	De modo adicional se ha eleborado un v�deo en el que se puede ver de forma m�s realista la ejecuci�n del programa. La reproducci�n del v�deo no incluye sonido.

	En el programa se ha reproducido el comportamiento en los rebotes contra los muros del juego original. Es decir, cuando la bola toca el muro por la parte frontal la direcci�n de salida de la bola depender� de la posici�n relativa del choque. Si la bola golpea el muro por la parte central la bola ser� rebotada de modo horizontal, mientras que si golpea por las partes laterales la bola adquirir� un �ngulo proporcional a la distancia del centro del muro.

	Esta aplicaci�n se ha desarrollado como primera pr�ctica evaluable para la asignatura de "Creando Interfaces de Usuarios" de la menci�n de Computaci�n del grado de Ingenier�a Inform�tica de la Universidad de Las Palmas de Gran Canaria en el curso 2019/20 y en fecha de 8/2/2020 por el alumno Juan Sebasti�n Ram�rez Artiles.
