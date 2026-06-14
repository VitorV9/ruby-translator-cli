require_relative 'translator'

puts "====== TRADUTOR RUBY CLI ======"
puts ""

print "Digite o texto que deseja traduzir: "
text_input = gets.chomp

print "Digite o idioma de origem (ex: pt, en, es): "
from_input = gets.chomp

print "Digite o idioma de destino (ex: en, es, pt): "
to_input = gets.chomp

translator = Translator.new(text_input, from_input, to_input)
puts "\nTraduzindo..."
resultado = translator.translate

puts "\nTexto Traduzido: #{resultado}"
puts ""

translator.save_to_file