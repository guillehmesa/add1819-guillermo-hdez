#!/usr/bin/ruby
#Autor: Guillermo Hernández Mesa
#Este script consiste en control de software con el comando softwarectl.
option = ARGV[0]
filename = ARGV[1]

#Comprueba si el programa está instalado con el comando --status
def check(f_package)
  status = `whereis #{f_package[0]} |grep bin |wc -l`.to_i
    if status == 0
      puts "#{f_package[0]} -> Uninstalled"
    elsif status == 1
      puts "#{f_package[0]} -> Installed"
    end
end

#Instala/desinstala el programa
def install(f_package)
  status = `whereis #{f_package[0]} |grep bin |wc -l`.to_i
  action = "#{f_package[1]}".to_s

  if action == "install"
    if status == 0
      `apt-get install -y #{f_package[0]}`
      puts "#{f_package[0]} -> (I) installed"
    elsif status == 1
      puts "#{f_package[0]} -> (I) ya está instalado"
    end

  elsif action == "remove"
      if status == 1
        `apt-get remove -y  #{f_package[0]}`
        puts "#{f_package[0]} -> (U) uninstalled"
      elsif status == 0
        puts "#{f_package[0]} -> (U) no está instalado"
      end
  end
end


if option.nil?
  puts 'Comando ejecutado sin argumentos, para más ayuda, ejecuta systemctl --help'
elsif option == '--help'
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
elsif option == '--version'
  puts '  Autor : Guillermo Hdez Mesa
    Fecha de Creación : 14/01/2020'
elsif option == '--status'
  file = `cat FILENAME.txt`
  f_lines = file.split("\n")
  f_lines.each do |a|
    f_package = a.split(":")
    check(f_package)
  end

elsif option == '--run'
  user = `whoami`.to_i

  if user == 0
    file = `cat FILENAME.txt`
    f_lines = file.split("\n")
    f_lines.each do |a|
      f_package = a.split(":")
      install(f_package)
    end

  elsif user != 0
    puts "Se necesita ser usuario root para ejecutar el script"
    exit 1
  end
end
