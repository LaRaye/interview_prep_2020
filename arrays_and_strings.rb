require 'pry'

#determine if string has all unique characters

#1st approach -- sort string, then iterate through & compare each character to the next to see if same
def all_unique?(str)
  arr = str.downcase.chars.sort
  dup = []

  arr.each_with_index  do |char, i|
    if char == arr[i += 1]
      dup << char
    end
  end

  if dup != []
    return false
  else
    return true
  end

end

#with another data structure --> using hash
def all_unique?(str)
  if str.length > 26
    return false
  end

  char_hash = Hash.new(false)

  str.each_char do |char|
    if char_hash[char]
      return false
    else
      char_hash[char] = true
    end
  end

  return true
end

#without array, store each character in variable, iterate through & compare

def each_unique?(str)
  str = str.downcase
  current_char = str[0]

  str.each_with_index do |char, i|
    if char == current_char

    end
  end
end

##########################

def compress(str)

  char_hash = {}

  str.split("").each do |char|
    if char_hash[char]
      char_hash[char] = char_hash[char] += 1
    else
      char_hash[char] = 1
    end
  end

  compressed = ""

  char_hash.each { |k, v| compressed << "#{k}"  + "#{v}"}

  if compressed.length <= str.length
    return compressed
  else
    return str
  end
end

##########################
# [1,2,3,4]       [13,9,5,1]
# [5,6,7,8]       [14,10,6,2]
# [9,10,11,12]    [15,11,7,3]
# [13,14,15,16]   [16,12,8,4]


matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
#reversed = [[13,14,15,16],[9,10,11,12],[5,6,7,8],[1,2,3,4]]

matrix.reverse!.each_with_index do |_,i|
  (0...i).each { |j| matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i] }
end

matrix.map(&:reverse!).each_with_index do |_,i|
  (0...i).each { |j| matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i] }
end

##########################
# [1,2,3]   [0,2,3]
# [0,5,6]   [0,0,0]
# [7,8,9]   [0,8,9]

#zeroed_matrix = [[0,2,3], [0,0,0], [0,8,9]]

matrix = [[1,2,3],[0,5,6],[7,8,9]]

def set_zeroes(matrix)
  column = []
  row = []

  matrix.each_with_index do |row_arr, index|
    row_arr.each_with_index do |el, i|
      if el == 0
        rows[index] = true
        columns[i] = true
      end
    end
  end

  rows.each_with_index do |v, i|
    if v
      matrix[i] = matrix[i].collect {|el| el = 0}
    end
  end

  columns.each_with_index do |v, i|
    if v
      matrix.each {|row_arr| row_arr[i] = 0}
    end
  end

  return matrix
end

def set_zeroes(matrix)
  rows = {}
  columns = {}

  matrix.each_with_index do |row_arr, index|
    row_arr.each_with_index do |el, i|
      if el == 0
        rows[index] = true
        columns[i] = true
      end
    end
  end

  rows.each_key do |k|
    matrix[k] = matrix[k].collect {|el| el = 0}
  end

  columns.each_key do |k|
    matrix.each {|row_arr| row_arr[k] = 0}
  end

  return matrix
end

########################

#try to create #is_substring?
def is_substring?(str1, str2)
  hash1 = {}
  hash2 = {}

  str1.each_char do |c|
    if hash1[c]
      hash1[c] += 1
    else
      hash1[c] = 1
    end
  end

  str2.each_char do |c|
    if hash2[c]
      hash2[c] += 1
    else
      hash2[c] = 1
    end
  end

  return hash1 == hash2
end

def is_rotation?(str1, str2)

  str1_str1 = ""

  if str1.length == str2.length && str1.length != 0
    str1_str1 = str1 + str1
  end

  return is_substring?(str1_str1, str2)
end
