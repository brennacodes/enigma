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

    def cryptionize(input_chunks, how)
        output = []
        input_chunks.each do |chunk|
          chunk.each do |letter|
            if !Enigma::ALPHABET.include?(letter) 
                output.push(letter) 
            elsif how == 'encrypt'
                output.push(@shift_array.first.values_at(letter))
            else how == 'decrypt'
                output.push(@shift_array.first.key(letter))
            end
            @shift_array.rotate!
          end
        end
        @message = output.join('')
    end    

    def crypt_message(input, how)
        input_array = input.chars
        chunks = input_array.each_slice(4)
        get_shift_hashes
        cryptionize(chunks, how)
    end
end