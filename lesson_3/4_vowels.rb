vowel_arr = %w( a e i o u )
vowel_hash = {}

("a".."z").each.with_index(1) { |letter, index| vowel_hash[letter] = index if vowel_arr.include?(letter) }
