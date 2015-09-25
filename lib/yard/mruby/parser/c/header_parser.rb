module YARD::MRuby::Parser::C
  class HeaderParser < Parser
  end

  #
  # Register all header files (.h) to be processed with the above HeaderParser
  YARD::Parser::SourceParser.register_parser_type :header, HeaderParser, 'h'
end
