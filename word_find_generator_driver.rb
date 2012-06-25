require_relative "word_find_generator"

test_words = ["sinatra", "door", "window", "rails"]

word_find = WordFindGenerator.new(10, 20, test_words)
word_find.print_board

1.times { puts "=" * word_find.cols}
test_words.each_with_index do |word, word_index|
  print "#{word_index + 1}. #{word} "
  puts if ((word_index + 1) % 6) == 0
end