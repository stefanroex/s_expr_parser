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
  end
end
