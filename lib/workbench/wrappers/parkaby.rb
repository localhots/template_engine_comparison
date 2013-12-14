module Workbench
  module Wrappers
    class Parkaby < Base
      def initialize path
        @engine = ::Parkaby::Template.string(File.read(path))
      end

      def render context, args = {}
        @engine.render(OpenStruct.new(args))
      end
    end
  end
end

