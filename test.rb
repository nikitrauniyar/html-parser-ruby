require 'nokogiri'
require 'open-uri'
require 'uri'

puts 'Enter a URL'
url=gets.chomp
document=Nokogiri::HTML.parse(URI.open(url))

puts "The title of the html is #{document.title}"
puts '----------------------------------------------'
puts "All the links in a html page"
links=document.xpath('//a')
links.each_with_index do |link, index|
  puts "#{index+1} #{link[:href]} - #{link.text}"
end
puts '----------------------------------------------'
puts 'All the sources of the image used'
imgs=document.xpath('//img')
imgs_src=imgs.map{|i| i[:src]}
imgs_src.each_with_index do |src, index|
  puts "#{index+1} #{src}"
end

puts '----------------------------------------------'
puts 'All the H1 of the page'
headers=document.css('h1')
headers.each do |h1|
  puts h1.text
end
puts '----------------------------------------------'
puts 'All the Classes of the p tag used in html'
paragraphs=document.css('p')
paragraphs.each_with_index do |p,index|
  puts "#{index+1} #{p[:class]}"
end





