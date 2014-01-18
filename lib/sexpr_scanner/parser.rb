require 'strscan'

module SexprScanner
  class Parser < StringScanner
    def parse!
      parse.first
    end

    private

    def parse
      result = []
      until eos?
        skip(/\s+/)
        matcher = matchers.find { |matcher| matcher.call(self) }
        case match = matcher.format(matched)
        when '('
          result << parse
        when nil
          break
        else
          result << match
        end
      end
      result
    end

    def matchers
      Matchers.constants.map do |m|
        Matchers.const_get(m)
      end
    end

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
end
