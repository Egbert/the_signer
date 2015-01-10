require 'active_support/core_ext/string/inflections'
class TheSigner::Assignment

  attr_reader :application
  attr_reader :elements

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

end
