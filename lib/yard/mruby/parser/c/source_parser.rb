module YARD::MRuby::Parser::C
  class SourceParser < Parser
  end

  #
  # Register all header files (.h) to be processed with the above HeaderParser
  YARD::Parser::SourceParser.register_parser_type :source, SourceParser, 'c'

end
