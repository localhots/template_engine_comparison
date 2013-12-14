module Wrappers
  class Base
    attr_reader :tpl

    def initialize path
      @tpl = File.read(path)
    end
  end
end
