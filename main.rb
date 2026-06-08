require_relative 'mtu'

caminho_arquivo = ARGV[0]

unless File.exist?(caminho_arquivo)
  puts "Erro: Arquivo '#{caminho_arquivo}' não encontrado."
  puts "Uso: ruby main.rb <nome_do_arquivo.txt>"
  exit
end

entrada_teste = File.read(caminho_arquivo).strip

puts "================================================="
puts " Iniciando a Máquina de Turing Universal (MTU)"
puts "================================================="
puts "Arquivo lido: #{caminho_arquivo}"
puts "Entrada Bruta: \n#{entrada_teste}"
puts "-------------------------------------------------"

maquina = MTU.new(entrada_teste)
decisao = maquina.processar

puts "-------------------------------------------------"
puts "RESULTADO DA SIMULAÇÃO:"
puts "Decidiu?        #{decisao ? 'ACEITOU (Verdadeiro)' : 'REJEITOU (Falso)'}"

indice_separador = maquina.fita.index("#")
fita_final = maquina.fita[(indice_separador + 1)..-1].join

puts "Fita Resultante: #{fita_final}"
puts "Cursor parou em: #{maquina.cursor - indice_separador - 1}"
puts "Estado final:    #{maquina.estado_atual}"
puts "Lendo símbolo:   #{maquina.fita[maquina.cursor] || '_'}"
puts "================================================="