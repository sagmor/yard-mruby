
require_relative '../spec_helper'

def header(src, file = 'stdin.h')
  YARD::Registry.clear
  parser = YARD::Parser::SourceParser.new(:header)
  parser.file = file
  parser.parse(StringIO.new(src))
end

def header_line(src)
  header <<-EOF
    #include "mruby.h"
    #ifndef HEADER_H
    #define HEADER_H
    MRB_BEGIN_DECL
    #{src}
    MRB_END_DECL
    #endif
  EOF
end
