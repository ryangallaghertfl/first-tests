def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars) #problem is here, inclusive .. vs exclusive ... range
    # p key.chars.uniq
    # p ('a'..'z').to_a
    # p ('a'..'z').to_a - key.chars
    # exit 
    ciphertext_chars = plaintext.chars.map do |char|
    #   p "cipher.find_index(char):" 
    #   p cipher.find_index(char)
    #   p char
    #   p cipher
      (65 + cipher.find_index(char)).chr
    end
    return ciphertext_chars.join
  end
  
  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    # p cipher
    plaintext_chars = ciphertext.chars.map do |char|
    #   p char
    #   p char.ord
    #   p cipher
      out_char = cipher[char.ord - 65] # -4, so switched around
    #   p "should be t"
    #   p "actually is: #{out_char}"
    end
    return plaintext_chars.join
  end
  
  # Intended output:
  #
  p encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  p "=> EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  p "=> theswiftfoxjumpedoverthelazydog"


  # ORIGINAL VERSION

#   def encode(plaintext, key)
#     cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
#     ciphertext_chars = plaintext.chars.map do |char|
#       (65 + cipher.find_index(char)).chr
#     end
#     return ciphertext_chars.join
#   end
  
#   def decode(ciphertext, key)
#     cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
#     plaintext_chars = ciphertext.chars.map do |char|
#       cipher[65 - char.ord]
#     end
#     return plaintext_chars.join
#   end
  
  # Intended output:
  #
  # > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  # > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  # => "theswiftfoxjumpedoverthelazydog"