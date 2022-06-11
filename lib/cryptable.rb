module Cryptable
    DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    

    def offsets
        (DATE.to_i ** 2).digits.reverse.last(4)
    end

    def sampler
        (0..9).to_a.sample(4)
        # Array.new(4) {rand(0..9)}
    end
end