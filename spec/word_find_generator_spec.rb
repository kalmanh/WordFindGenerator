require "rspec"
require_relative "../word_find_generator"

describe WordFindGenerator do

  it "should find hidden words" do
    test_words = ["sinatra", "door", "window", "rails"]

    100.times do
      word_find = WordFindGenerator.new(15, 12, test_words)
      test_words.each do |word|
        word_find.contains? word
      end
    end
  end
end