module YARD::Handlers::C
  class MRubyBase < Base
    DEFAULT_NAMESPACES = {
      'mrb->object_class' => 'Object'
    }

    def namespace_for_variable(var)
      return DEFAULT_NAMESPACES[var] if DEFAULT_NAMESPACES[var]
      super
    end


  end
end
