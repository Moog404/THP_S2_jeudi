 def get_all_the_urls_of_val_doise_townhalls
	tab_url =[]
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
news_links = page.css("a").select{|link| link['class'] == "lientxt"}
# news_links.each{|link| puts link['href'] }
	news_links.each do |link| 
		mail = link['href'].sub(".","http://annuaire-des-mairies.com")
		tab_url << mail
	end
tab_url
end