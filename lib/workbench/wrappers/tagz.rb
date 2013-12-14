module Workbench
  module Wrappers
    class Tagz < Base
      def initialize path
        @tpl = File.read(path)
        @context = Context.new
      end

      def render context, args = {}
        @context.with_args(args).instance_eval(tpl)
      end

      class Context
        include ::Tagz

        def with_args args
          @args = args
          self
        end

        def method_missing method, *args
          if @args.key?(method)
            @args[method]
          else
            super
          end
        end
      end
    end
  end
end
