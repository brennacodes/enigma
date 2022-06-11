module Cryptable
    DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    

    def offsets
        (DATE.to_i ** 2).digits.reverse.last(4)
    end

    def generate_key
        (0..9).to_a.sample(5).join('')
    end

    def shifter
        @@key == Integer ? get_integer_shifter : get_string_shifter
    end

    def get_string_shifter
        key_array = @@key.chars.map! {|value| [value, @@key[@@key.index(value) + 1]]}
        clean_array = key_array.take_while {|idx| key_array.index(idx) < 4}
        clean_array.map! {|pair| pair.join('').to_i}
    end

    def get_integer_shifter
        key_array = @@key.digits.reverse.map! {|value| [value, @@key[@@key.index(value) + 1]]}
        clean_array = key_array.take_while {|idx| key_array.index(idx) < 4}
        clean_array.map! {|pair| pair.join('').to_i}
    end
end