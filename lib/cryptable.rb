module Cryptable
  @@cryption = 'input'
  @@array = []

  def alphabet
    ('a'..'z').to_a << " "
  end

  def a_shift_hash
    alphabet.zip(alphabet.rotate(a_shift)).to_h
  end

  def b_shift_hash
    alphabet.zip(alphabet.rotate(b_shift)).to_h
  end

  def c_shift_hash
    alphabet.zip(alphabet.rotate(c_shift)).to_h
  end

  def d_shift_hash
    alphabet.zip(alphabet.rotate(d_shift)).to_h
  end

  def array_of_hashes
    @@array = [a_shift_hash, b_shift_hash, c_shift_hash, d_shift_hash]
  end

  def self_assess
    return @@array.first.values_at(@@cryption) if self.instance_of?(Encrypt) == true
    return @@array.first.key(@@cryption) if self.instance_of?(Decrypt) == true
  end
  
  def cryptionize(input_chunks)
    array_of_hashes
    output = []
    input_chunks.each do |chunk|
      chunk.each do |letter|
        @@cryption = letter
        output.push(self_assess)
        @@array.rotate!
      end
    end
    output.join('')
  end
end
