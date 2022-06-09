 require 'helper'
 
 class Decrypt

    def initialize(message, *arguments)
     @message = message
     @key = arguments[0] || key_generator
     @date = arguments[1] || todays_date
     @start = decrypt_output(@message, @key, @date)    
    end

    def decrypt_output(message, key, date)
    {
      :decryption => @message,
      :key => @key,
      :date => @date
    }
  end
end
