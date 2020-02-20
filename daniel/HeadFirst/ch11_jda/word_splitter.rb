# This class allows you to perform various operations
# on the words in a string.
class WordSplitter
  include Enumerable

  # The string to split into words.
  attr_accessor :string

  # Creates a new instance with its string
  # attribute set to the given string.
  def initialize(string)
    self.string = string
  end

  # Passes each word in the string to a block, one
  # at a time.
  def each(bypass = false)
    return if bypass

    string.split(' ').each do |word|
      yield word if block_given?
    end
  end
end

if $PROGRAM_NAME == __FILE__
  splitter = WordSplitter.new
  splitter.string = 'how do you do'

  splitter.each do |word|
    puts word
  end

  p(splitter.find_all { |word| word.include?(?d) })
  p(splitter.reject { |word| word.include?(?d) })
  p(splitter.map(&:reverse))
  p(splitter.any? { |word| word.include?(?e) })
  p splitter.count
  p splitter.first
  p splitter.sort
end
