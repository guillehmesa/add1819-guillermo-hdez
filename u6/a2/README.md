# Salt-stack
## Preparativos
Vamos a crear 2 MVs OpenSUSE. La primera se llamará __master21g__ y tendrá la IP __172.19.21.31__; y la segunda se llamará __minion21g__ y tendrá la IP __172.19.21.32__.

## Master: Instalar y configurar
Instalamos el software del master con el comando `zypper install salt-master` y modificamos el fichero `/etc/salt/master` para configurar nuestro Master.

![Captura 1](img/1.png)

Activaremos el servicio en el arranque del sistema, iniciamos el servicio y consultamos los minions aceptados, veremos que no hay ninguno. (en mi caso si hay uno, pero no hay que hacerle caso)

![Captura 2](img/2.png)

## Minion
### Instalación y configuración
Instalamos el software del agente con `zypper install salt-minion` y modificamos el fichero `/etc/salt/minion` para definir quien será nuestro master.

![Captura 3](img/3.png)

Ahora activamos el Minion en el arranque del sistema, iniciamos el servicio y comprobamos que no tiene __apache2__ instalado.

![Captura 4](img/4.png)

### Aceptación desde el Master
Vamos a la MV1 y nos aseguramos de que el cortafuegos permite las conexiones al servicio Salt.

![Captura 5](img/5.png)

Ahora vemos que el Master recibe petición del Minion.

![Captura 6](img/6.png)

Vamos a hacer que el Master acepte a dicho Minion y comprobamos.

![Captura 7](img/7.png)

### Comprobamos conectividad
Vamos a comprobar la conectividad desde el Master a los Minions.

![Captura 8](img/8.png)

## Salt States
### Preparar el directorio para los estados
En la MV Master, creamos los directorios `/srv/salt/base` y `/srv/salt/devel`.

![Captura 9](img/9.png)

Ahora creamos un fichero `/etc/salt/master.d/roots.conf` con el siguiente contenido:

![Captura 10](img/10.png)

Reiniciamos el servicio del Master.

![Captura 11](img/11.png)

### Crear un nuevo estado
Creamos el fichero `/srv/salt/base/apache/init.sls` con el siguiente contenido:

![Captura 12](img/12.png)

### Asociar Minions a estados
Crear `/srv/salt/base/top.sls` donde asociamos a todos los minions con el estado que acabamos de definir.

![Captura 13](img/13.png)

### Comprobar estados definidos
Ejecutamos el siguiente comando para consultar los estados que tenemos definidos.

![Captura 14](img/14.png)

### Aplicar el nuevo estado
Consultamos los estados en detalle para verificar que no hay errores.

![Captura 15](img/15.png)
![Captura 16](img/16.png)

Ahora aplicamos el nuevo estado en todos los minions.

![Captura 17](img/17.png)
![Captura 18](img/18.png)

## Crear más estados
### Crear estado "users"
Creamos un estado llamado __users__ que nos sirve para crear un grupo y usuarios en las máquinas minios.

Creamos el directorio `/srv/salt/base/users` y dentro el fichero `init.sls` con las definiciones para crear el grupo __mazingerz__ y los usuarios __koji21__ y __drinfierno21__ dentro del grupo.

![Captura 19](img/19.png)

Ahora aplicamos el estado.

![Captura 20](img/20.png)
![Captura 21](img/21.png)

Vamos a la MV Minion y comprobamos.

![Captura 22](img/22.png)

### Crear estado "directories"
Creamos el estado llamado __directories__ para crear las carpetas `private`(700), `public`(755) y `group`(750) en el home del usuario __koji21__.

![Captura 23](img/23.png)

Ahora aplicamos el estado.

![Captura 24](img/24.png)

## Añadir Minion de otro SO
Crearemos una MV3 con SO Windows que se llame __minion21w__

Nos descargamos el `Salt-minion` y lo instalamos.

![Captura 25](img/25.png)

Vamos al __CMD__ y activamos el servicio.

![Captura 26](img/26.png)

Ahora vamos a la MV Master y comprobamos las peticiones pendientes.

![Captura 27](img/27.png)

Lo agregamos al master y volvemos a comprobar.

![Captura 28](img/28.png)
