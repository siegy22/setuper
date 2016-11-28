require "setuper/version"

module Setuper
  extend self

  def yn?(question)
    begin
      io.puts question + " [y/n]"
      input = io.gets.chomp
    end until %w(y n).include?(input)
    input == 'y'
  end

  def ask(question)
    io.puts question
    io.gets.strip
  end

  def list(question)
    io.puts question + " (Comma separated)"
    texts = io.gets.split(',').map(&:strip)
    io.puts "Okay, got #{texts.count} items."
    texts
  end
  alias_method :ask_for_list, :list

  # choose
  def choose(*options, question: "Please choose:")
    option_map = options
      .map(&:to_s)
      .map
      .with_index { |x, i| [i + 1, x] }
      .to_h

    begin
      io.puts question

      option_map.each do |key, option|
        io.puts "  Type #{key} for \"#{option}\""
      end
      input = io.gets.chomp.to_i
    end until option_map.keys.include?(input)

    option_map[input]
  end
  alias_method :pick, :choose

  def io=(io)
    @io = io
  end

  def io
    @io ||= Kernel
  end
end
