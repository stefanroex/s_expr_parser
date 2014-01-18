# S-Expression Parser

S-Expression Parser written in Ruby.

## Usage

```ruby
SExprParser::Parser.new("(def list (1 2 3))").parse! #=> [:def, :first, [1, 2, 3]]
```
