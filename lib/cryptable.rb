module Cryptable
    @@cryption = 'input'

    def offsets
        (@date.to_i ** 2).digits.reverse.last(4)
    end

    def generate_key
        (0..9).to_a.sample(5).join('')
    end

    def shifter
        key_array = @key.chars.map! {|value| [value, @key[@key.index(value) + 1]]}
        clean_array = key_array.take_while {|idx| key_array.index(idx) < 4}
        clean_array.map! {|pair| pair.join('').to_i}
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
        Enigma::ALPHABET.zip(Enigma::ALPHABET.rotate(index)).to_h
    end

    def letter_indices
        letter_array = ('A'..'D').to_a
        letter_array.each_index {|index| @shift_array << get_shift(index)}
        @shift_array.map! {|shift| shift_hash(shift)}
    end

    def cryptionize(input_chunks, how)
        output = []
        input_chunks.each do |chunk|
          chunk.each do |letter|
            if letter == Enigma::SPECIAL_CHARS
                next letter
            end
            @@cryption = letter
            how == 'encrypt' ? output.push(@shift_array.first.key(@@cryption)) : next
            how == 'decrypt' ? output.push(@shift_array.first.values_at(@@cryption)) : next
            @shift_array.rotate!
          end
        end
        @message = output.join('')
    end    

    def crypt_message(input, how)
        input_array = input.chars
        chunks = input_array.each_slice(4)
        letter_indices
        cryptionize(chunks, how)
    end

    def output_message
        puts "Created #{@output_to_file} with the key #{@key} and date #{@date}"
    end
end