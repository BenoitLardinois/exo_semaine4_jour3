require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'


#JSON
=begin
def save_as_jason
  scrap = Scrapping.new.perform

  File.open("./db/emails.json","w") do |f|
    f.write(scrap.to_json)
  end
end

save_as_jason
=end



#GOOGLE (A CORRIGER)
=begin
def save_as_spreadsheet
  scrap = Scrapping.new.perform
  
  session = GoogleDrive::Session.from_config("config.json")
  
  ws = session.spreadsheet_by_key("13m0L_3IXmsIcK2eJt59gzkHzPr8P6HXDwPs7HaAGGbs").worksheets[0]
  
  row = 1
  
  scrap.each do |key, value|
    ws[row,1] = key
    ws[row,2] = value
    row += 1
    
    ws.save
  end
    
end

#4/1AY0e-g5lGsk0wXgThgDuK1lF7X1I3KgNU4VM_ZN5zR6sDPzvYTpJooA2A10

save_as_spreadsheet
=znd




#CSV
=begin
def save_as_csv
  scrap = Scrapping.new.perform
    
  File.open("./db/emails.csv","w") do |f|
    f.write(scrap.to_csv)
  end
end
save_as_csv
=end
def save_as_csv
  scrap = Scrapping.new.perform
  
  scrap.reduce({}, :merge)
  
  binding.pry
 
  CSV.open("./db/emails.csv","wb") {|csv| scrap.to_a.each {|elem| csv << elem} }
end
save_as_csv









#-------------EXO----------------
#JSON

#Lire un fichier JSON
=begin
#dans app.rb
json = File.read('./db/input.json')
obj = JSON.parse(json)

pp obj

#dans input.json
{
  "India" : [
    "Sachin Tendulkar",
    "Virender Sehwag",
    "Gautam Gambhir"
  ]
}
=end

#Ecrire un fichier Json à partir d'un objet Ruby
#Lancer app.rb
=begin
my_hash = {
  "moi" => "Ben",
  "toi" => "Joe"
  }
File.open('./db/input.json', 'w') do |f|
  f.write(my_hash.to_json)
end
=end



#CSV

=begin
puts CSV.read("./db/thing.csv")
=end
