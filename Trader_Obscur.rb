require 'rubygems'
require 'nokogiri'         
require 'open-uri'




while true 

	def cryptoname
	crypto_name = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |item|
	        nom = item.text
	        crypto_name << nom
	end
	 crypto_name 
	end

	def cryptovalue
	crypto_value = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
	       value = item.text
	        crypto_value << value
		end
		crypto_value
	end



	Hash_crypto = Hash[cryptoname.zip(cryptovalue)]
	# Hash_crypto.each do |names, value|
	# 		puts "#{names} ===> #{value}"
	# end
	puts Hash_crypto


sleep 3600
end

