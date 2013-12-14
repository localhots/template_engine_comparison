module Workbench
  module Wrappers
    class Tenjin < Base
      def initialize path
        @path = path
        @engine = ::Tenjin::Engine.new
      end

      def render context, args = {}
        @engine.render(@path, args)
      end
    end
  end
end
