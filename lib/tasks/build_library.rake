require 'net/http'
require 'uri'
require 'open-uri'

namespace :build_library do
    task :get_data => :environment do
        
        Pref.all.each do |pref|
            hash = Hash.from_xml(open(URI.escape("http://api.calil.jp/library?appkey=0ad4317b132c04a2e02646d886c446f&pref=" + pref.name)).read)

            hash["Libraries"]["Library"].each do |row|

                cityName = City.convName(row["city"], row["post"])
                
                if row["address"].match(/横浜市保土ヶ谷区/)
                    row["address"].sub!(/横浜市保土ヶ谷区/, '横浜市保土ケ谷区')
                    row["city"] = "横浜市保土ケ谷区"
                end
                
                if ! City.find_by(:name => cityName)
                    match = row["address"].match(/#{row["pref"]}(#{cityName}.+?区)/)
                    cityName = match[1]
                end
                
                if ! row["address"].match(/#{row["pref"]}#{row["city"]}(.+$)/)
                   pp row
                end
                
                row["address"].sub!(/#{row["pref"]}#{row["city"]}/, '')
                
                libraryCategory = LibraryCategory.find_or_create_by(:name => row["category"])
                
                latlng = row["geocode"].split(",")
                
                Library.create(:name => row["formal"], :lib_id => row["libid"], :url => row["url_pc"], :pref_id => Pref.find_by(:name => row["pref"]).id, :city_id => City.find_by(:name => cityName).id, :address => row["address"], :post => row["post"], :tel => row["tel"], :lat => latlng[1], :lng => latlng[0], :library_category_id => libraryCategory.id)
            end
        end
        
    end
end
