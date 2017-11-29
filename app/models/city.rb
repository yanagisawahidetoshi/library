class City < ApplicationRecord
    def self.convName(name, post)
        name = "柴田郡柴田町"     if name == "柴田町"
        name = "富谷市"           if name == "黒川郡富谷町"    
        name = "北村山郡大石田町" if name == "北村"    
        name = "新潟市中央区"     if post == "951-8121"    
        name = "上伊那郡辰野町"   if name == "辰野町"
        name = "横浜市保土ケ谷区" if name == "横浜市保土ヶ谷区"
        name = "赤穂郡上郡町"     if name == "⾚穂郡上郡町"
        name = "吉野郡下市町"     if name == "吉野郡下市"
        name = "北葛城郡王寺町"   if name == "王寺町"
        name = "岡山市北区"       if post == "700-0823"
        name = "熊本市中央区"     if post == "860-0862" || post == "862-8680"
        name = "熊本市北区"       if post == "861-5598"
        name = "熊本市東区"       if post == "862-8502" || post == "862-8652"
        name = "熊本市西区"       if post == "860-0082"
        name = "中頭郡西原町"     if post == "903-0214"
        name = "横浜市保土ケ谷区" if post == "240-8501"
        name = "糟屋郡須惠町"     if name == "糟屋郡須恵町"
        
        name
    end
end
