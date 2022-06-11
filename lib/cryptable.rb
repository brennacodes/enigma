module Cryptable
    DATE = Date.today.strftime('%m%d%y')
    ALPHABET = ('a'..'z').to_a << " "
    
    @@cryption = 'input'

    def offsets
        (DATE.to_i ** 2).digits.reverse.last(4)
    end

    def generate_key
        (0..9).to_a.sample(5).join('')
    end

    def shifter
        key_array = @key.chars.map! {|value| [value, @key[@key.index(value) + 1]]}
        clean_array = key_array.take_while {|idx| key_array.index(idx) < 4}
        clean_array.map! {|pair| pair.join('').to_i}
        # letter_indices
    end
    
    def get_key(index)
        shifter[index]
    end
    
    def get_offset(index)
        offsets[index].to_i
    end
    
    def get_shift(index)
        get_key(index) + get_offset(index)
    end
    
    def shift_hash(index)
        ALPHABET.zip(ALPHABET.rotate(index)).to_h
    end

    def letter_indices
        letter_array = ('A'..'D').to_a
        letter_array.each_index {|index| @shift_array << get_shift(index)}
        @shift_array.map! {|shift| shift_hash(shift)}
    end

end