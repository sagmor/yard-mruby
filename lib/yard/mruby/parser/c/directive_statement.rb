module YARD::MRuby::Parser::C
  class DirectiveStatement < YARD::Parser::C::Statement
    attr_accessor :declaration
    attr_accessor :comments
  end
end
