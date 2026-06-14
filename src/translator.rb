require 'net/http'
require 'json'

class Translator
    def incialize(text, from, to)
        @text = text
        @from = from
        @to = to
    end