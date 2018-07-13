
require 'rubygems'
require 'nokogiri'         
require 'open-uri'

require './mails_ValOise'



# Pour récupérer le mail de la ville de Vaureal

def get_the_email_of_a_townhal_from_its_webpage
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
 puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
# get_the_email_of_a_townhal_from_its_webpage


# Pour avoir l'url de toutes les communes du Val d'Oise

def get_all_the_urls_of_val_doise_townhalls
	tab_url =[]
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		news_links = page.css("a").select{|link| link['class'] == "lientxt"}
		news_links.each do |link| 
			mail = link['href'].sub(".","http://annuaire-des-mairies.com")
			tab_url << mail
		end
	puts tab_url
end

# puts get_all_the_urls_of_val_doise_townhalls


#Pour extraire tous les mails à partir de chaque url

def mail_extract_on_url
	tab_mail =[]
	get_all_the_urls_of_val_doise_townhalls.each do |url|
		page = Nokogiri::HTML(open(url))
 		tab_mail << page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 	end
 	tab_mail
end
# puts mail_extract_on_url 
# en lançant mail_extract_url celui ci va récupérer les mails de chaque commune du 95 dans un tableau que j'enregistre dans mails_ValOise.rb



# Pour avoir le nom de toutes les communes du Val d'Oise

def townhall_name
	townhall = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		page.xpath('//p/a').each do |name|
			townhall << name.text
		end
	townhall
end

#Création du Hash

def create_hash
 	town_with_email = Hash[townhall_name.zip(mail_save)]
 	town_with_email.each do |city, mail|
 		puts "#{city} ===> #{mail}"
	end
end



def perform
	get_the_email_of_a_townhal_from_its_webpage
	get_all_the_urls_of_val_doise_townhalls
	create_hash
end

perform

 





















