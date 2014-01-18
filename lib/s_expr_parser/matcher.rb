require 'forwardable'

module SExprParser
  Matcher = Struct.new(:scanner) do
    extend Forwardable

    def_delegators :scanner, :scan, :matched

    def call
      raise NotImplementedError
    end

    def format
      raise NotImplementedError
    end
  end
end
