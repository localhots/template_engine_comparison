module Workbench
  module Wrappers
    class Mustache < Base
      def render context, args = {}
        ::Mustache.render(tpl, args)
      end
    end
  end
end
