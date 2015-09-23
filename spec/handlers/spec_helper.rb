require_relative '../spec_helper'
require 'stringio'

def undoc_error(code)
  lambda { StubbedSourceParser.parse_string(code) }.should raise_error(Parser::UndocumentableError)
end

def with_parser(parser_type, &block)
  tmp = StubbedSourceParser.parser_type
  StubbedSourceParser.parser_type = parser_type
  yield
  StubbedSourceParser.parser_type = tmp
end

class StubbedProcessor < YARD::Handlers::Processor
  def process(statements)
    statements.each_with_index do |stmt, index|
      find_handlers(stmt).each do |handler|
        handler.new(self, stmt).process
      end
    end
  end
end

class StubbedSourceParser < YARD::Parser::SourceParser
  StubbedSourceParser.parser_type = :ruby
  def post_process
    post = StubbedProcessor.new(self)
    post.process(@parser.enumerator)
  end
end
