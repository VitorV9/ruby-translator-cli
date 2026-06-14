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