require 'rubygems'
require 'nokogiri'         
require 'open-uri'




while true # tant que c'est vrai je j'exécute le programme, je répète donc le programme


# tableau des noms 

	def crypto_name
	cryptoname = []
		page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |item|
	    nom = item.text
	    cryptoname << nom
		end
	 cryptoname 
	end

	crypto_name

# tableau des valeurs 

	def crypto_value
	cryptovalue = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
	       value = item.text
	        cryptovalue << value
		end
		cryptovalue
	end


# hash | nom, valeur|
def crypto_name_and_value
	hash_crypto = Hash[crypto_name.zip(crypto_value)]
	hash_crypto.each do |names, value|
		puts "#{names} ===> #{value}"
	end
end
	crypto_name_and_value

puts "============================== refresh dans une 1 heure ================================"
sleep 3600 # je demande au programme de s'arréter pendant 3600 secondes avant de se relancer

end

# pour arrêter le programme CRTL + Z

