 require 'helper'
 
 class Encrypt

    def initialize(message, arguments)
     @message = message
     @key = arguments[0] || key_generator
     @date = arguments[1] || todays_date
     @start = encrypt_output(@message, @key, @date)    
    end

    def encrypt_output(message, key, date)
    {
      :encryption => @message,
      :key => @key,
      :date => @date
    }
  end
end
