module YARD::MRuby::Parser
  module C
    class Parser < YARD::Parser::C::CParser
    end

    # Disable default C Parser
    YARD::Parser::SourceParser.parser_types.delete(:c)
    YARD::Parser::SourceParser.parser_type_extensions.delete(:c)
  end
end
