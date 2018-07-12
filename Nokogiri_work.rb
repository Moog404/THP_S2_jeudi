
require 'rubygems'
require 'nokogiri'         
require 'open-uri'
# require 'rest-client'

# page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   with require "open-uri"
# page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/")) with require 'rest-client'
# puts page.class   # => Nokogiri::HTML::Document


page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))
   
links = page.css("a")
# puts links.length   # => 7
# puts links[0].text   # => Click here
# puts links[0]["href"] # => http://www.google.com

# <a href="http://www.google.com">Click here</a>


news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }
puts news_links.class # => Array





news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet  



