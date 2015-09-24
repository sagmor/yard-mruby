module YARD::MRuby::Handlers
  module Header
    class Base < YARD::Handlers::Base
    end
  end

  YARD::Handlers::Processor.register_handler_namespace :header, Header
end
