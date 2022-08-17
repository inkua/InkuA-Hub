# Entorno de desarrollo para el Hub de InkuA

## Instalación

Descargar e instalar [Git](https://git-scm.com/) 
[Vagrant](https://www.vagrantup.com) y 
[VirtualBox](https://www.virtualbox.org/).

Reiniciar.

Abrir una consola de comandos, ir al directorio donde quieras instalar VVV y ejecutar:

(!En Windows, en vez de utilizar GIT, descargar el repositorio como archivo zip, para no modificar los saltos de linea de los archivos unix binarios)
```shell
git clone https://github.com/inkua/InkuA-Hub.git
cd InkuA-Hub
vagrant plugin install --local
vagrant up --provision
```
Quizás tengas que correr varias veces el comando vagrant up --provision, hasta que se instale todo correctamente y la máquina virtual se pueda ejecutar.

## Utilizar
Ahora puedes ingresar panel de control en [http://vvv.test](http://vvv.test). Y al sitio de InkuA en [https://dev.inkua.de](https://dev.inkua.de)

Puedes encontrar el directorio raiz de la aplicación en:
    
```shell
cd www/foobar/public_html

Ahora puedes cargar vscode escribiendo:
code . 

De esa forma puedes empesar a editar el sitio y realizar pruebas. 
```
## Usuarios:
Mysql: root - root

dev.inkua.de:
- Administrador: admin . admin
- Usuario: testuser / testuser


## Preguntas:
Utilizar github o el espacio de la intranet para realizar preguntas y postear problemas.








---
---
---


# README ORIGINAL DE VVV:


VVV is a local developer environment, mainly aimed at [WordPress](https://wordpress.org) developers. It uses [Vagrant](https://www.vagrantup.com) and VirtualBox/Parallels/HyperV to create a linux server environment for building sites, and contributing to WordPress itself.

_VVV stands for Varying Vagrant Vagrants._

## How To Use

To use it, download and install [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org/). Then, clone this repository and run:

```shell
vagrant plugin install --local
vagrant up --provision
```

When it's done, visit [http://vvv.test](http://vvv.test).

The online documentation contains more detailed [installation instructions](https://varyingvagrantvagrants.org/docs/en-US/installation/).

* **Web**: [https://varyingvagrantvagrants.org/](https://varyingvagrantvagrants.org/)
* **Contributing**: Contributions are more than welcome. Please see our current [contributing guidelines](https://varyingvagrantvagrants.org/docs/en-US/contributing/). Thanks!

## Minimum System requirements

[For system requirements, please read the system requirements documentation here](https://varyingvagrantvagrants.org/docs/en-US/installation/software-requirements/)

## Software included

For a comprehensive list, please see the [list of installed packages](https://varyingvagrantvagrants.org/docs/en-US/installed-packages/).
