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
        matcher = matchers.find { |matcher| matcher.call }
        case match = matcher.format
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
        Matchers.const_get(m).new(self)
      end
    end
  end
end
