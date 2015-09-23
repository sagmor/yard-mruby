module YARD
  module MRuby
    module Handlers
      module Header
        class Base < YARD::Handlers::Base
          include YARD::Parser::C
        end
      end
    end
  end
end
