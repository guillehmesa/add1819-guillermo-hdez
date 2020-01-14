#!/usr/bin/ruby
#Autor: Guillermo Hernández Mesa
#Este script consiste en control de software con el comando softwarectl.

filename = ARGV[1]

#Muestra mensaje de error al estar los argumentos vacios.
def empty_arguments
  puts 'Comando ejecutado sin argumentos, para más ayuda, ejecuta systemctl --help'
end

#Muestra la ayuda con el comando --help
def help
  puts 'Usage:
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
        atomix:remove'
end

#Muestra la información con el comando --version
def info
  puts '  Autor : Guillermo Hdez Mesa
  Fecha de Creación : 14/01/2020'
end

#Comprueba si el programa está instalado con el comando --status
def check
  status = `zypper se #{f_package[0]} |grep bin |wc -l`
    if status == 0
      puts 'Uninstalled'
    else
      puts 'Installed'
    end
end

#Comprueba si eres root con el comando --run
def run
  user = `whoami`.chop
  if user == 'root'
    file = `cat FILENAME.txt`
    f_lines = file.split("\n")
    f_lines.each do |a|
      f_package = a.split(":")
      check(f_package)
    end
  else
    puts 'Se nesecita ser usuario root para ejecutar el script'
    exit 1
  end
end

#Instala el programa
def install
  status = `whereis #{f_package[0]} |grep bin |wc -l`
  action = "#{f_package[1]}"

  if action == "install"
    if status == 0
      `apt-get install -y #{f_package[0]}`
      puts 'Installed'
    else
      puts 'Ya está instalado'
    end
  end
end

#Desinstala el programa
def remove
  status = `whereis #{f_package[0]} |grep bin |wc -l`
  action = "#{f_package[1]}"

  if action == "remove"
    if status == 0
      `apt-get remove -y #{f_package[0]}`
      puts 'Uninstalled'
    else
      puts 'No está instalado'
    end
  end
end

def menu
  option = ARGV[0]
  if option.nil?
    empty_arguments
  elsif option == '--help'
    help
  elsif option == '--version'
    info
  elsif option == '--status'
    check
  elsif option == '--run'
    run
  end
end

puts menu
