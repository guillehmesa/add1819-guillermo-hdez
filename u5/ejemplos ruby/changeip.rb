#!/usr/bin/ruby

require 'Rainbow'

def get_network_information
  # Get network information
  data = {}
  items = %x[ip a | grep 'inet ' | grep -v 'host lo'].split
  data[:ip] = items[1]
  data[:device] = items.last

  items = %x[ip route | grep default].split
  data[:gateway] = items[2]

  ok = system('ping -c1 8.8.4.4 > /dev/null')
  data[:internet] = (ok ? 'Ok' : Rainbow('No access').red)
  ok = system('host www.nba.com > /dev/null')
  data[:dns] = (ok ? 'Ok' : Rainbow('No access').red)
  return data
end

def reset
  data = get_network_information
  puts "[INFO] #{Rainbow('Reset').bright} configuration..."
  `ipdown #{data[:if_name]}`
  `ipup #{data[:if_name]}`
end

def set_classroom109
  puts "[INFO] Setting '#{Rainbow('classroom109').bright}' configuration..."
  `sudo ip addr add 172.19.21.0/16 dev #{data[:if_name]}`
end

def set_myhome
  puts "[INFO] Setting '#{Rainbow('myhome').bright}' configuration..."
  `ip addr add 192.168.1.116/24 dev #{data[:if_name]}`
end

def menu
  puts " 1. Reset"
  puts " 2. Classroom 109"
  puts " 3. My home"
  print "\n Select option [Enter=exit]: "
  option = gets.chop

  if option == '1'
    reset
  elsif option == '2'
    set_classroom109
  elsif option == '3'
    set_myhome
end

menu
