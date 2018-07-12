require 'rubygems'
require 'nokogiri'         
require 'open-uri'


def depute_name
namedepute = []
page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576")).css(".titre_normal").each do |item|
        nom = item.text
        namedepute << nom
end
 namedepute
end 


# def depute_mail
# namedepute = []
# page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576"))
#         mailing = page.css("a").select{|link| link['<span>Email :</span>'] == "ann_mail"}
#       	mailing.each do |link|
#       		mail= link['href']
#         namedepute << mail
# end
#  namedepute
# end 


def depute_mail
  mail = []
    page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576'))
  
	# page.xpath("//a[starts-with(@href, \"mailto:\")]/@href").each do |email|
	page.css('a[@href ^="mailto:"]').each do |email|
    mail << email.text
  end
  mail
end



def create_hash
 	namedepute_with_deputeemail = Hash[depute_name.zip(depute_mail)]
 	namedepute_with_deputeemail.each do |city, mail|
 		puts "#{city} ===> #{mail}"
	end
end

create_hash