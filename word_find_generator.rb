class WordFindGenerator

  attr_accessor :rows, :cols, :hidden_words

  def initialize(rows = 10, cols = 10, hidden_words)
    self.rows = rows
    self.cols = cols
    self.hidden_words = hidden_words
    @random_chars = ("A".."Z").to_a
    initialize_board
    put_words_in
  end

  def initialize_board
    @board = []
    rows.times do
      row = ""
      cols.times { row << random_letter }
      @board << row
    end
  end

  def contains?(word)
    word.upcase!
    word.reverse! unless @processed_words.include?(word)
    @board.detect { |row| row.include? word }
  end

  def put_words_in
    hidden_words.each do |word|
      @previously_selected_rows ||= []
      random_row_num = find_random_row until random_row_num && (!@previously_selected_rows.include?(random_row_num))
      @previously_selected_rows << random_row_num
      processed_word = process_word(word)
      @processed_words ||= []
      @processed_words << processed_word
      random_row = @board[random_row_num]
      random_col = find_random_column(random_row, processed_word)
      random_row[random_col...(random_col + processed_word.length)] = processed_word
    end
  end

  def process_word(orig_word)
    new_word = (rand(2) == 0) ? orig_word : orig_word.reverse
    new_word.upcase
  end

  def find_random_row
    rand(@board.length)
  end

  def find_random_column(row, word)
    row_length = row.length
    word_length = word.length
    raise "The length of #{word}(#{word_length}) is greater than allowed(#{row_length})" if word_length > row_length
    found_col = rand(row_length) until (found_col && (found_col + word_length <= row_length))
    found_col
  end

  def random_letter
    @random_chars[rand(@random_chars.length)]
  end

  def print_board
    @board.each do |row|
      row.each_char {|letter| print letter}
      puts
    end
  end
end

