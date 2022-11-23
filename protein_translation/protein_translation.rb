# frozen_string_literal: true

# class - Transslation
#   class methods
#     - of_codon -> input: a string or array of strings, output: a string
#     - of_rna -> input: a string, output: a string

# data
#  hash
#  array
#  strings

# algorithm
# of_codon
# if the input is a string over 3 characters long, split the string.
# for each of the elements if it is included in the array that is a key, return the value to an array
# if the value is STOP - break and return results.
# join the results with a space to return the key

# of_rna
#  split the string into an array of characters 3 characters long
#  for

AMINOACIDS = { ['AUG'] =>	'Methionine',
               %w[UUU UUC] =>	'Phenylalanine',
               %w[UUA UUG]	=> 'Leucine',
               %w[UCU UCC UCA UCG]	=> 'Serine',
               %w[UAU UAC] =>	'Tyrosine',
               %w[UGU UGC] => 'Cysteine',
               ['UGG'] => 'Tryptophan',
               %w[UAA UAG UGA] => 'STOP' }.freeze

class InvalidCodonError < StandardError
end

class Translation
  def self.of_codon(codon)
    codon = split_codon(codon)
    result = []

    codon.each do |strand|
      AMINOACIDS.each_key do |key|
        result << AMINOACIDS[key] if key.include?(strand)
        break if AMINOACIDS[key] == 'STOP'
      end
    end
    result.join(' ')
  end

  def self.split_codon(strand)
    results = []
    strand.chars.each_slice(3) { |str| results << str }
    results.map(&:join)
  end

  def self.of_rna(codon)
    raise InvalidCodonError if invalid_sequence?(codon)

    codon = split_codon(codon)
    result = []

    codon.each do |strand|
      AMINOACIDS.each_key do |key|
        result << AMINOACIDS[key] if key.include?(strand)
      end
    end
    remove_stop(result.uniq)
  end

  def self.remove_stop(arr)
    stop_idx = arr.index('STOP')
    arr[0...stop_idx]
  end

  def self.invalid_sequence?(sequence)
    sequence.match?(/[^AUG]/)
  end
end
