def cipher(string, shift)
letters = string.split("")
lowercase = ('a'..'z').to_a
uppercase = ('A'..'Z').to_a

  shift %= 26 if shift > 26
  
  letters.map! do |letter|
    if lowercase.include?(letter)
      number = lowercase.index(letter) + shift
      number = (26 - number).abs if number > 25
      letter = lowercase[number]
      
    elsif uppercase.include?(letter)
      number = uppercase.index(letter) + shift
      number = (26 - number).abs if number > 25
      letter = uppercase[number]
      
    else
      letter
    end
  end
  letters.join("")
  
end

cipher("kingdon", 6)