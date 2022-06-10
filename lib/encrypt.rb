 require 'helper'
 
 class Encrypt < Crypt
    def encrypt_output(message, key, date)
    {
      :encryption => encrypt_message(@message),
      :key => @key,
      :date => @date
    }
    end
end
