module Workbench
  module Wrappers
    class Slim < Base
      def initialize path
        @engine = ::Slim::Template.new{ File.read(path) }
      end

      def render context, args = {}
        @engine.render(OpenStruct.new(args))
      end
    end
  end
end
