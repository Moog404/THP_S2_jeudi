require 'rubygems'
require 'nokogiri'         
require 'open-uri'


# page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#    array =[]
#    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
#     news_links = page.css("a").select{|link| link['class'] == "text left col symbol"}
#     news_links.each do |link|    
#         array << link
#     end

#     p array
# #
def cryptoname
crypto_name = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".text-left").each do |item|
        nom = item.text
        crypto_name << nom
end
 crypto_name 
end 

puts cryptoname


def cryptovalue
cryto_value = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
       value = item.text
        cryto_value << value
	end
	crypto_value
end


	Name_crypto_value = Hash[crypto_name.zip(cryto_value)]
	Name_crypto_value.each do |names, value|
		puts "#{names} ===> #{value}"
end

