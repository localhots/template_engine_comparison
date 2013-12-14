module Workbench
  module Wrappers
    class Tagz < Base
      def initialize path
        require path

        if path.end_with?('small.rb')
          @tpl = TagzTemplates::Small.new
        else
          @tpl = TagzTemplates::Big.new
        end
      end

      def render context, args = {}
        @tpl.with_args(args).render
      end
    end
  end
end

module TagzTemplates
  class Base
    include Tagz

    def with_args args
      args.each do |key, val|
        instance_variable_set(:"@#{key}", val)
      end

      self
    end
  end
end
