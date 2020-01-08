#!/usr/bin/ruby
#Autor: Guillermo Hernández Mesa
#Este script consiste en control de software con el comando softwarectl

option = ARGV[0]
filename = ARGV[1]

if option == "--help"
  puts "Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creación.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:
        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove"

elsif option == "--version"
  puts "Autor: Guillermo Hernández Mesa
Fecha:'08/01/2020"
