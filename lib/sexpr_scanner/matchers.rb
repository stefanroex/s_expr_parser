module SexprScanner
  module Matchers
    class Parentheses < Matcher
      def call
        scan(/\(/)
      end

      def format
        matched
      end
    end

    class Integer < Matcher
      def call
        scan(/\-*\d+/)
      end

      def format
        matched.to_i
      end
    end

    class String < Matcher
      def call
        scan(/"([^"\\]|\\.)*"/)
      end

      def format
        eval(matched)
      end
    end

    class Definitions < Matcher
      def call
        scan(/\S+(?<!\))/)
      end

      def format
        matched.to_sym
      end
    end

    class NullMatcher < Matcher
      def call
        true
      end

      def format
        nil
      end
    end
  end
end
