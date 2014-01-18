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
        case match = next_match.format
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

    def next_match
      Matchers.all(self).find(&:call)
    end
  end
end
