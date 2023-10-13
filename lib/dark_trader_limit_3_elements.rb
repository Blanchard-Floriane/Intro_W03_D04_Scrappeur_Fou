require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

@page = Nokogiri::HTML(URI.open(PAGE_URL)) #@page pour utiliser ma variable dans toutes mes méthodes

# pour récupérer le xpath, selecter dans inspecteur et ansuite copy -> copy xpath

def crypto_symbols
  # xpath('....table/tbody/tr[position]') ce que je lui dis c'est que dans la table => le corps du tableau => tr (table row) => td[2] pour la 3e colonne => div => a[1] 
  scrapping_crypto_symbols = @page.xpath('//td[contains(@class, "by__symbol")]') #cherche directement l'élément avec la class "by_symbol" à la fin du nom de class
  crypto_symbols_array = [] #pour réunir les smboles
  index = 0 
  scrapping_crypto_symbols.each do |element| #va boucler sur chaque row
    if index >= 19 #va limiter à 3 itérations => 3 éléments scrappés
      break #stoppe la boucle
    else
      crypto_symbols_array << element.text #ajoute mon élément à chaque boucle
    end
    index += 1
  end
  #puts "Scraping symbols okay"
  return crypto_symbols_array
end

def crypto_prices
  scrapping_crypto_prices = @page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span') # tbody/tr/td[4] pour indiquer la 5e colonne de ma ligne, puis la div, et enfin l'élément class "a" 

  crypto_prices_array = [] #pour réunir les smboles
  index = 0
  scrapping_crypto_prices.each do |element|
    if index >= 19
      break
    else
      crypto_prices_array << element.text
    end
    index += 1
  end
  #puts "Scraping prices okay"
  return crypto_prices_array
end

def crypto_scrapper
  crypto_hash = Hash[crypto_symbols.zip(crypto_prices)]
  crypto_hash.each{|key,value| puts "#{key} : #{value}"}
  # parcours l'ensemble du hashes et à chaque row il va faire un puts de la key et de la value ==> permet une présentation plus soignée du tableau
end

crypto_scrapper

