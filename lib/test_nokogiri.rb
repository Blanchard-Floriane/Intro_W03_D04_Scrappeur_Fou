require 'rubygems'
require 'nokogiri'
require 'open-uri' # to deal with webpage lives on a remote site


PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"

page = Nokogiri::HTML(URI.open(PAGE_URL))
  #The Nokogiri::HTML construct takes in the opened file's contents and wraps it in a special Nokogiri data object.

# A node is any piece of individual content, such as a page, poll, article, forum topic, or a blog entry
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com

