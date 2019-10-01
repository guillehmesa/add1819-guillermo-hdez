# A1 Acceso Remoto SSH

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
Vamos a entrar en **/etc/ssh** y comprobamos si están los ficheros `ssh_host*key` y `ssh_host*key.pub`
