# A1 Acceso Remoto SSH
## Preparativos
Vamos a la máquina `ssh-server21g` y añadimos a **/etc/hosts** los equipos `ssh-client21g` y `ssh-client21w`.
![Captura 0.1](img/0.1.png)

Ahora comprobamos que hay conexión entre ambos equipos.
![Captura 0.2](img/0.2.png)

Vamos a la máquina `ssh-client21g` y añadimos a **/etc/hosts** los equipos `ssh-server21g` y `ssh-client21w`.
![Captura 0.3](img/0.3.png)

Ahora comprobamos que hay conexión entre ambos equipos.
![Captura 0.4](img/0.4.png)

Vamos a la máquina `ssh-client21w` e instalamos el software cliente SSH, usaremos *PuTTY*.
Ahora añadiremos a **C:\Windows\System32\drivers\etc\hosts** los equipos `ssh-server21g` y `ssh-client21g`.
![Captura 0.5](img/0.5.png)

Ahora comprobamos que hay conexión entre ambos equipos.
![Captura 0.6](img/0.6.png)

##  Primera conexión SSH GNU/Linux
Vamos al cliente `ssh-client21g` que hemos creado y hacemos un ping a `ssh-server21g` para comprobar la conectividad con el servidor.

![Captura 1](img/1.png)

Ahora vamos a la máquina real y comprobamos si los puertos están abiertos en el servidor.
![Captura 2](img/2.png)

Vamos a ir a la maquina Cliente y nos conectamos mediante ssh al servidor Linux.
![Captura 3](img/3.png)

Ahora si nos volvemos a conectar nos sale:
![Captura 4](img/4.png)

A continuación vamos a comprobar el contenido de **/.ssh/know_hosts** en el equipo `ssh-client21g`.
![Captura 5](img/5.png)

## Primera conexión SSH desde cliente Windows
Entramos en el cliente Windows y nos conectamos por SSH usando PuTTY.
![Captura 6](img/6.png)
![Captura 7](img/7.png)

## Cambiamos la identidad del servidor y comprobamos
Vamos a entrar en **/etc/ssh** y comprobamos si están los ficheros `ssh_host*key` y `ssh_host*key.pub`.
![Captura 8](img/8.png)

Ahora modificaremos el fichero de configuración **(IMPORTANTE: entrar como root para modificarlo)** `/etc/ssh/sshd_config `para dejar una única linea: `HostKey /etc/ssh/ssh_host_rsa_key` (Quitar # de la linea).
![Captura 9](img/9.png)

Ahora entramos como usuario root y ejecutamos `ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key`y no poner contraseña al certificado de la máquina. A continuación reiniciamos el servicio SSH y comprobamos que se está ejecutando correctamente.
![Captura 10](img/10.png)
![Captura 11](img/11.png)

Ahora comprobamos que sucede al volver a conectarnos desde los clientes `hernandez1` y `hernandez2`.
![Captura 12](img/12.png)
![Captura 13](img/13.png)

Para solucionarlo ejecutamos el comando `ssh-keygen -R ssh-server21g -f /home/guillermo/.ssh/know_hosts`.
![Captura 14](img/14.png)

Por último veremos que nos deja de nuevo acceder a los clientes.
![Captura 15](img/15.png)
![Captura 16](img/16.png)

## Autenticación mediante claves públicas
Vamos a la máquina **ssh-client21g** e iniciamos seción con nuestro usuario **guillermo**. Luego generamos un par de claves con el comando **ssh-keygen -t rsa** en los directorios `/home/guillermo/.ssh/id_rsa` y `/home/guillermo/.ssh/id_rsa.pub`.
![Captura 17](img/17.png)
![Captura 18](img/18.png)

Ahora vamos a copiar la clave pública `id_rsa.pub` al fichero `autorized_keys` del usuario remoto **hernandez4**. Utilizaremos el comando `ssh-copy-id hernandez4@ssh-server21g`.
![Captura 19](img/19.png)

Por último comprobamos si nos deja acceder remotamente vía SSH. Desde **ssh-client21g** no se pide password, en cambio desde **ssh-client21w** sí se pide.
![Captura 20](img/20.png)
![Captura 21](img/21.png)

## Uso de SSH como túnel para X
Vamos a instalar en el servidor una Aplicación de entrono gráfico que no esté en los clientes. Vamos a elegir la Aplicación **Geany**.
![Captura 22](img/22.png)

Ahora modificamos el fichero `/etc/ssh/sshd_config` para permitir la ejecución de aplicaciones gráficas. La opción `X11Forwarding yes` .
![Captura 23](img/23.png)

Entramos en la máquina **cliente21g** y comprobamos si Geany está instalado `zypper se geany`.
![Captura 24](img/24.png)

Ahora comprobamos desde el cliente que funciona el Geany del servidor. Utilizaremos el comando `ssh -X hernandez1@ssh-server21g`.
![Captura 25](img/25.png)

## Restricciones de uso
### Restricción sobre un usuario
En el servidor tenemos el usuario **hernandez2**. Vamos a modificar el SSH de modo que al usar ese usuario desde los clientes tendremos permiso denegado. Entramos en el fichero `/etc/ssh/sshd_config` para restringir el acceso a determinados usuarios. Pondremos `DenyUsers hernandez2`
![Captura 26](img/26.png)

Ahora comprobaremos la restricción al acceder desde los clientes. Como veremos no nos deja poner la contraseña.
![Captura 27](img/27.png)
![Captura 28](img/28.png)

### Restricción sobre una aplicación
Creamos el grupo `remoteapps` e incluimos al usuario **hernandez4** a este grupo.
![Captura 29](img/29.png)

Localizamos el programa Geany y miramos que permisos tiene.
![Captura 30](img/30.png)

Ahora cambiaremos el programa al grupo `remoteapps`
![Captura 31](img/31.png)
![Captura 32](img/32.png)

Podremos los permisos del ejecutable a 750.
![Captura 33](img/33.png)

Ahora comprobamos el funcionamiento en el servidor en local y desde el cliente en remoto.
![Captura 34](img/34.png)
![Captura 35](img/35.png)
