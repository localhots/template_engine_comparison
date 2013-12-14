module Workbench
  class Benchmark
    class << self
      def describe_engines engines
        @@engines = engines
      end
    end

    TERMINAL_WIDTH = 60
    BM_WIDTH = 46

    def initialize args, &block
      puts '#' * TERMINAL_WIDTH
      puts '##' + args[:title].center(TERMINAL_WIDTH - 4) + '##'
      puts '#' * TERMINAL_WIDTH

      ::Benchmark.bm(TERMINAL_WIDTH - BM_WIDTH) do |benchmark|
        @@engines.each do |name, attrs|
          GC.start
          benchmark.report(name) do
            args[:loops].times{ yield(name, attrs) }
          end
        end
      end

      puts
    end
  end
end
