require 'json'
class ProgrammingLang

attr_accessor :name

def initialize(name)
  @name = name
end

def search_by_name
  @results_by_name = []
   languages.each do |lang|
     key, value = lang.first
     if (key == 'Name')
       @results_by_name << lang if (value.downcase.eql? name.downcase.strip)
     end
  end
  @results_by_name
end

def search_by_type
  @results_by_type = []
   languages.each do |lang|
     key = lang.keys[1]
     value = lang.values[1]
     saparate_value = value.split(",") # split string
     if (key == 'Type') # check if it is type search
       @results_by_type << lang if (saparate_value.any?{ |e| e.downcase.include?(name.downcase.strip) }) # find value if it is present in hash

     end
  end
  @results_by_type
end

def search_by_designed
  @results_by_designed = []
   languages.each do |lang|
     key, value = lang.to_a.last
     saparate_value = value.split(",")
     if (key == 'Designed by')
       @results_by_designed << lang if (saparate_value.any?{ |e| e.downcase.include?(name.downcase.strip) })
     end
  end
  @results_by_designed
end

private
def languages
  file = File.read('public/json/data.json')
  data_hash_languages = JSON.parse(file)
end

end
