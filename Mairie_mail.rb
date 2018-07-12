
require 'rubygems'
require 'nokogiri'         
require 'open-uri'
require './programme_url'

##############VAUREAL####################
# # def get_the_email_of_a_townhal_from_its_webpage
# # 	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
# # 	page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |adress|
# # 		puts adress.text
# # 	end
# # end

# get_the_email_of_a_townhal_from_its_webpage

def city_name
	city = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath('//p/a').each do |name|
		city << name.text
	end
	city
end



#  def get_all_the_urls_of_val_doise_townhalls
# 	tab_url =[]
# 	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
# news_links = page.css("a").select{|link| link['class'] == "lientxt"}
# # news_links.each{|link| puts link['href'] }
# 	news_links.each do |link| 
# 		mail = link['href'].sub(".","http://annuaire-des-mairies.com")
# 		tab_url << mail
# 	end
# tab_url
# end


def mail_extract_url
	tab_mail =[]
	get_all_the_urls_of_val_doise_townhalls.each do |url|
		page = Nokogiri::HTML(open(url))
 		 tab_mail << page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 		end
 		tab_mail
 	end


def create_hash
 	city_with_email = Hash[city_name.zip(mail_extract_url)]
 	city_with_email.each do |city, mail|
 		puts "#{city} ===> #{mail}"
	end
end

 create_hash

 





















