 require 'helper'
 
 class Decrypt < Crypt
    def decrypt_output(message, key, date)
    {
      :decryption => crypt_message(@text_input),
      :key => @key,
      :date => @date
    }
  end
end
