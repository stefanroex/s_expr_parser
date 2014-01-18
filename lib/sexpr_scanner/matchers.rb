module SexprScanner
  module Matchers
    module Parentheses
      def self.call(scanner)
        scanner.scan(/\(/)
      end

      def self.format(match)
        match
      end
    end

    module Integer
      def self.call(scanner)
        scanner.scan(/\-*\d+/)
      end

      def self.format(match)
        match.to_i
      end
    end

    module String
      def self.call(scanner)
        scanner.scan(/"([^"\\]|\\.)*"/)
      end

      def self.format(match)
        eval(match)
      end
    end

    module Definitions
      def self.call(scanner)
        scanner.scan(/\S+(?<!\))/)
      end

      def self.format(match)
        match.to_sym
      end
    end

    module CatchAll
      def self.call(scanner)
        true
      end

      def self.format(match)
        nil
      end
    end
  end
end
