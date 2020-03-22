
matrix = [[1,2,3],[0,5,6],[7,8,9]]

def set_zeroes(matrix)
  columns = []
  rows = []

  matrix.each_with_index do |row_arr, index|

    row_arr.each_with_index do |el, i|
      if el == 0
        columns << i
        rows << index
      end
    end

  end

  columns.each do |c|
    matrix.each {|row_arr| row_arr[c] = 0}
  end

  rows.each do |r|
    matrix[r] = matrix[r].collect {|el| el = 0}
  end

  return matrix
end


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
