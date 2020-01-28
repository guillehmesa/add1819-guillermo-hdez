# Vagrant con Virtualbox
## 3.3: Comprobar proyecto 1
__vagrant up__ para iniciar una nueva instancia de la máquina.

![Captura 1](img/1.png)

__vagrant ssh__ para entrar en nuestra máquina virtual usando SSH.

![Captura 2](img/2.png)

## 5.2: Comprobar proyecto 2
Comprobamos que el puerto 4567 está a la escucha. __vagrant port__ para ver la redirección de puertos de la máquina Vagrant.

![Captura 3](img/3.png)

Abrimos el navegador web con el URL __http://127.0.0.1:4567__.

![Captura 4](img/4.png)

## 6.1: Proyecto 3 (Suministro Shell Script)

Creamos el directorio __vagrant21-proyecto3__ y dentro un proyecto Vagrant.

![Captura 5](img/5.png)
![Captura 6](img/6.png)

Creamos un script que se llame __insatll_apache.sh__.

![Captura 7](img/7.png)

Ahora modificamos el fichero __Vagrantfile__ y agregamos la línea a la configuración.

![Captura 8](img/8.png)

Hacemos __vagrant reload__ para recargar la MV y verificamos que el servidor apache se ha instalado e iniciado correctamente.

![Captura 9](img/9.png)

## 6.2: Proyecto 4 (Suministro mediante Puppet)

Creamos el directorio __vagrant21-proyecto4__ y dentro un proyecto Vagrant.

![Captura 10](img/10.png)

Modificamos el archivo __Vagrantfile__.

![Captura 11](img/11.png)

Ahora hay que crear el fichero __manifests/default.pp__, con las órdenes/instrucciones puppet para instalar el programa __nmap__.

![Captura 12](img/12.png)

Entramos por ssh a la MV e instalamos el __puppet__.

![Captura 13](img/13.png)

Ahora vamos a aplicar los cambios. Recargamos la configuraciónde la MV y volvemos a ejecutar la provisión.

![Captura 14](img/14.png)
![Captura 15](img/15.png)

Por último, comoprobamos que se instaló el __nmap__.

![Captura 16](img/16.png)
