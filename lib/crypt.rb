require 'helper'

class Crypt
  attr_reader :text_input, :key, :date

  def initialize(text_input, key = generate_key, date = todays_date)
    @text_input = text_input
    @key = key
    @date = date
    @start = crypt_message(@text_input, @key, @date)
  end
end
