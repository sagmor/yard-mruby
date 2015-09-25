require_relative 'c/source'
require_relative 'c/header'

YARD::Handlers::Processor.namespace_for_handler.delete(:c)
