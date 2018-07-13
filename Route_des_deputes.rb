require 'rubygems'
require 'nokogiri'         
require 'open-uri'


# Pour récupérer le nom de tous les députés 

def depute_name
name_array = []
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576")).css(".titre_normal").each do |item|
        nom = item.text
        name_array << nom
end
 name_array
end 

# Pour récupérer le mail de tous les députés 

def depute_mail
  mail_array = []
    page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576'))
	# page.xpath("//a[starts-with(@href, \"mailto:\")]/@href").each do |email|
	page.css('a[@href ^="mailto:"]').each do |email|
    mail_array << email.text
  end
  mail_array
end



def create_hash
 	name_depute_with_depute_email = Hash[depute_name.zip(depute_mail)]
 	name_depute_with_depute_email.each do |city, mail|
 		puts "#{city} ===> #{mail}"
	end
end

create_hash





# def depute_mail
# depute_mail = []
# page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576"))
#         mailing = page.css("a").select{|link| link['<span>Email :</span>'] == "ann_mail"}
#         mailing.each do |link|
#           mail= link['href']
#         depute_mail << mail
# end
#  depute_mail
# end 