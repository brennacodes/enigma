module Cryptable
    DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    

    def offsets
        (DATE.to_i ** 2).digits.reverse.last(4)
    end
end