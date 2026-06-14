require 'net/http'
require 'json'
require 'uri'

class Translator
    def incialize(text, from, to)
        @text = text
        @from = from
        @to = to
    end

def translate
    texto_seguro = URI.encode_www_form_component(@text)
    url_string = "https://api.mymemory.translated.net/get?q=#{texto_seguro}&langpair=#{@from}|#{@to}"
    uri = URI(url_string)
    response = Net::HTTP.get(uri)

    dados_da_api = JSON.parse(response)
    @translated_text = dados_da_api["responseData"]["translatedText"]
    @translated_text
  end
  
end

def save_to_file
    current_time = Time.now.strftime("%d-%m-%y_%H-%M")
    filename = "#{current_time}.txt"

    File.open(filename, 'w') do |file|
      file.puts "--- Tradução Realizada em #{Time.now} ---"
      file.puts "Texto Original (#{@from}): #{@text}"
      file.puts "Texto Traduzido (#{@to}): #{@translated_text}"
    end
    
    puts "Resultado salvo com sucesso no arquivo: #{filename}"
  end
end