module YARD::MRuby::Parser::C
  class HeaderParser < Parser

    # Consumes a directive and generates a DirectiveStatement
    def consume_directive
      super if @in_body_statements

      @newline = false
      start = @index
      line = @line
      statement = DirectiveStatement.new(nil, @file, line)
      @statements << statement
      attach_comment(statement)

      multiline = false
      advance_loop do
        chr = char
        case chr
        when '\\'; multiline=true; advance
        when /\s/; consume_whitespace
        else advance
        end

        if @newline
          if multiline
            multiline = false
          else
            break
          end
        end
      end

      decl = @content[start...@index]

      statement.declaration = decl
    end

    def consume_body_statements
      @in_body_statements = true
      result = super
      @in_body_statements = false
      result
    end
  end

  #
  # Register all header files (.h) to be processed with the above HeaderParser
  YARD::Parser::SourceParser.register_parser_type :header, HeaderParser, 'h'
end
