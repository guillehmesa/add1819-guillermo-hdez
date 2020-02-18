# Docker
## Instalación y primeras pruebas
### Habilitar el acceso a la red externa a los contenedores
Miramos el archivo `/proc/sys/net/ipv4/ip_forward` para consltar el estado de __IP_FORWARD__.

![Captura 1](img/1.png)

Para activarlo, vamos a _Yast -> Ajustes de red -> Encaminamiento_ y seleccionamos __Habilitar reenvío de ipv4__.

![Captura 2](img/2.png)

Guardamos, reiniciamos y comprobamos que se cambió la configuración.

![Captura 3](img/3.png)

### Instalación
Instalaremos docker.

![Captura 4](img/4.png)

Ahora iniciamos el servicio y comprobamos la versión.

![Captura 5](img/5.png)

### Primera Prueba
Insertamos el usuario al grupo __docker__.

![Captura 6](img/6.png)

Ahora mostramos las imágenes descargadas hasta ahora.

![Captura 7](img/7.png)

Ahora vamos a mostrar los contenedores creados, que por el momento no hay ninguno.

![Captura 8](img/8.png)

Descargamos una imagen __hello-world__, creamos un contenedor y ejecutamos la aplicación que hay dentro.

![Captura 9](img/9.png)

Comprobamos que está la imagen.

![Captura 10](img/10.png)

Vemos que hay un contenedor en Estado __Exited__.

![Captura 11](img/11.png)

Ahora paramos el contenedor, lo eliminamos y comprobamos.

![Captura 12](img/12.png)
![Captura 13](img/13.png)

## Creación manual de nuestra imagen
### Crear un contenedor manualmente
Descargamos una imagen debian, para ello buscamos en los repositorios de __Docker Hub__, descargamos la imagen en local y comprobamos.

![Captura 14](img/14.png)
![Captura 15](img/15.png)

Creamos un contenedor con el nombre __con_debian__ a partir de la imagen que descargamos anteriormente y ejecutamos el programa `/bin/bash` dentro del contenedor.

![Captura 16](img/16.png)

### Personalizar el contenedor
Instalamos aplicaciones dentro del contenedor, como por ejemplo __Nginx__ y __vi__.

![Captura 17](img/17.png)
![Captura 18](img/18.png)
![Captura 19](img/19.png)

Crearemos un fichero HTML que se llame `holamundo.html`.

![Captura 20](img/20.png)

Creamos un script que se llame __/root/server.sh__

![Captura 21](img/21.png)

 Le ponemos permisos de ejecución.

 ![Captura 22](img/22.png)

### Creamos una imagen a partir del contenedor
A partir del contenedor creado, crearemos una nueva imagen que se llamará __guillermo/nginx1__ y comprobamos.

![Captura 23](img/23.png)

## Crear contenedor a partir de nuestra imagen
### Crear contenedor con Nginx
Iniciamos el contenedor a partir de la imagen anterior.

![Captura 24](img/24.png)

### Comprobamos
Abrimos una nueva terminal y hacemos `docker ps` para ver en que puerto se está ejecutando.

![Captura 25](img/25.png)

Abrimos un navegador y comprobamos que entra en el puerto y en __holamundo.html__.

![Captura 26](img/26.png)
![Captura 27](img/27.png)

Paramos el contenedor y lo eliminamos.

![Captura 28](img/28.png)

### Migrar la imagen a otra máquina
Exportamos la imagen docker a fichero tar.

![Captura 29](img/29.png)

Importaremos la imagen de un compañero de clase y la cargamos.

![Captura 39](img/39.png)

Crearemos un contenedor a partir de la nueva imagen.

![Captura 40](img/40.png)

Comprobamos por el navegador si funciona.

![Captura 41](img/41.png)
![Captura 42](img/42.png)


## Dockerfile
### Preparar ficheros
Creamos el directorio __/home/guillermo/docker21a__ y dentro copiamos los ficheros __holamundo.html__ y __server.sh__.

![Captura 30](img/30.png)
![Captura 31](img/31.png)

Creamos el fichero `Dockerfile`,.

![Captura 32](img/32.png)

### Crear imagen a partir del Dockerfile

Entramos en el directorio, construimos la imagen y comprobamos que se ha creado.

![Captura 33](img/33.png)
![Captura 34](img/34.png)

### Crear contenedor y comprobar
vamos a crear un contenedor con el nombre `app4nginx2` a partir de la imagen anteriormente creada.

![Captura 35](img/35.png)

Abrimos otro terminal y averiguamos el puerto de escucha del servidor Nginx.

 ![Captura 36](img/36.png)

 Comprobamos en el navegador.

 ![Captura 37](img/37.png)
 ![Captura 38](img/38.png)

### Usar imágenes ya creadas

Creamos el directorio __docker21b__  dentro creamos el Dockerfile.

![Captura 43](img/43.png)

Creamos la imagen y creamos el contenedor.

![Captura 44](img/44.png)
![Captura 45](img/45.png)

## Limpiar contenedores e imágenes
Cuando terminamos con los contenedores, los vamos a parar y destruir.

![Captura 46](img/46.png)
![Captura 47](img/47.png)
![Captura 48](img/48.png)
![Captura 49](img/49.png)
![Captura 50](img/50.png)
![Captura 51](img/51.png)
