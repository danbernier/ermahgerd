module Ermahgerd

  def self.translate(words)
    words.upcase.gsub(/[A-Z]+/) { |word| translate_word(word) }
  end

  def self.translate_word(word)
    # Don't translate short words
    return word if word.size == 1

    # Handle specific words
    dictionary = {
      'AWESOME' => 'ERSUM',
      'BANANA' => 'BERNERNER',
      'BAYOU' => 'BERU',
      'FAVORITE' => 'FRAVRIT',
      'FAVOURITE' => 'FRAVRIT',
      'GOOSEBUMPS' => 'GERSBERMS',
      'LONG' => 'LERNG',
      'MY' => 'MAH',
      'THE' => 'DA',
      'THEY' => 'DEY',
      'WE\'RE' => 'WER',
      'YOU' => 'U',
      'YOU\'RE' => 'YER'
    }

    return dictionary[word] if dictionary.key? word
    
    # Before translating, keep a reference of the original word
    original_word = word
    
    # Drop vowel from end of words. Keep it for short words, like "WE"
    word.sub!(/[AEIOU]$/, '') if original_word.size > 2

    # Reduce duplicate letters
    word.gsub!(/[^\w]|(.)(?=\1)/, '')

    # Reduce adjacent vowels to one
    word.gsub!(/[AEIOUY]{2,}/, 'E')      # TODO: Keep Y as first letter

    # DOWN -> DERN
    word.gsub!(/OW/, 'ER')

    # PANCAKES -> PERNKERKS
    word.gsub!(/AKES/, 'ERKS')

    # The mean and potatoes: replace vowels with ER
    word.gsub!(/[AEIOUY]/, 'ER')    # TODO: Keep Y as first letter

    # OH -> ER
    word.gsub!(/ERH/, 'ER')

    #MY -> MAH
    word.gsub!(/MER/, 'MAH')

    #FALLING -> FERLIN
    word.gsub!('ERNG', 'IN')

    #POOPED -> PERPERD -> PERPED
    word.gsub!('ERPERD', 'ERPED')

    #MEME -> MAHM -> MERM
    word.gsub!('MAHM', 'MERM')

    # Keep Y as first character
    # YES -> ERS -> YERS
    word = 'Y' + word if original_word[0] == 'Y'

    # Reduce duplicate letters
    word.gsub!(/[^\w]|(.)(?=\1)/, '')

    # YELLOW -> YERLER -> YERLO
    if original_word.end_with?('LOW') && word.end_with?('LER')
      word.sub!(/LER$/, 'LO')
    end

    return word
  end

end
