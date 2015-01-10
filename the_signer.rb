require 'active_support/core_ext/string/inflections'
class Assignment

  APPLICATIONS = ['a poster', 'a flyer', 'a report', 'a website', 'business cards']

  class Element < Struct.new(:name)
  end

  class Color < Element; end
  class Font < Element; end
  class Shape < Element; end
  class LayoutRule < Element; end

  ELEMENTS = {
    Color => %w[red blue],
    Font => %w[rockwell didot garamond helvetica],
    Shape => %w[square triangle circle],
    LayoutRule => ['everything on the right side']
  }.inject([]) do |list, (klass, names)|
    list += names.map(&klass.method(:new))
  end

  def initialize
    @application = APPLICATIONS.sample
    @elements = ELEMENTS.shuffle[0..4]
  end

  def sentence
    "You are going to design: #{@application}!\n
Use only the follow elements:
#{elements_text.join("\n")}
"
  end

  def elements_text
    @elements.map do |element|
      "#{element.class.name.demodulize.downcase}: #{element.name}"
    end
  end

end

puts Assignment.new.sentence
