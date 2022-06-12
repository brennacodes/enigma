module Cryptable
    def offsets
        (@date.to_i ** 2).digits.reverse.last(4)
    end

    def generate_key
        (0..9).to_a.sample(5).join('')
    end

    def shifter
        key.split('').each_cons(2) do |num_1, num_2|
            require 'pry'; binding.pry
            (num_1 + num_2).to_i
        end
    end
    
    def get_shift(index)
        shifter[index] + offsets[index].to_i
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
            if !Enigma::ALPHABET.include?(letter) 
                output.push(letter) 
            elsif how == 'encrypt'
                output.push(@shift_array.first.key(letter))
            else how == 'decrypt'
                output.push(@shift_array.first.values_at(letter))
            end
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
end