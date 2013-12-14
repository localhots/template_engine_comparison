module Workbench
  module Wrappers
    class Handlebars < Base
      @@context = ::Handlebars::Context.new

      def initialize path
        @engine = @@context.compile(File.read(path))
      end

      def render context, args = {}
        @engine.call(args)
      end
    end
  end
end

