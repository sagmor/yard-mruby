require_relative '../spec_helper'

def parse(src, file = '(stdin)')
  YARD::Registry.clear
  parser = YARD::Parser::SourceParser.new(:source)
  parser.file = file
  parser.parse(StringIO.new(src))
end

def parse_init(src)
  YARD::Registry.clear
  YARD.parse_string("void mrb_foo_gem_init(mrb_state *mrb) {\n#{src}\n}", :source)
end
