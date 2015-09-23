module YARD
  module MRuby
    module Handlers
      module Source
        class Base < YARD::Handlers::C::Base
          DEFAULT_NAMESPACES = {
            'mrb->object_class' => 'Object'
          }

          def namespace_for_variable(var)
            return DEFAULT_NAMESPACES[var] if DEFAULT_NAMESPACES[var]
            super
          end
        end
      end
    end
  end
end
