module Cryptable
    def offsets
        (@date.to_i ** 2).digits.reverse.last(4)
    end

    def generate_key
        (0..9).to_a.sample(5).join('')
    end

    def shifter
        key_shifts = []
        key.split('').each_cons(2) do |num_1, num_2|
            key_shifts << (num_1 + num_2).to_i
        end
        key_shifts
    end
    
    def get_shift(index)
        @shift_array.push(shifter[index] + offsets[index])
    end
    
    def shift_hash(shift)
        Enigma::ALPHABET.zip(Enigma::ALPHABET.rotate(shift)).to_h
    end

    def get_shift_hashes
        (1..4).to_a.each_index {|index| get_shift(index)}
        @shift_array.map! {|shift| shift_hash(shift)}
    end

    def is_a_special_character?(sym)
        !Enigma::ALPHABET.include?(sym)
    end

    def process_chunk(chunk, how)
        chunk.each do |letter|
            @crypt_output << (letter) if is_a_special_character?(letter) == true
            @crypt_output.push(@shift_array.first.values_at(letter)) if how == 'encrypt'
            @crypt_output.push(@shift_array.first.key(letter)) if how == 'decrypt'
            @shift_array.rotate!
        end
    end

    def cryptionize(input_chunks, how)
        input_chunks.each do |chunk|
            process_chunk(chunk, how)
        end
        @message = @crypt_output.join('')
    end    

    def crypt_message(input, how)
        input_array = input.chars
        chunks = input_array.each_slice(4)
        get_shift_hashes
        cryptionize(chunks, how)
    end
end