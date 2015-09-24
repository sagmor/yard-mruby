
module YARD::MRuby::Parser
  class HeaderParser < YARD::Parser::C::CParser
  end

  #
  # Register all header files (.h) to be processed with the above HeaderParser
  YARD::Parser::SourceParser.register_parser_type :header, HeaderParser, 'h'
end
