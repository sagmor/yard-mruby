module YARD::Handlers::C
  class MRubyBase < Base

    DEFAULT_NAMESPACES = {
      # 'mrb->top_self'      => '',
      'mrb->object_class'  => 'Object',
      'mrb->class_class'   => 'Class',
      'mrb->module_class'  => 'Module',
      'mrb->proc_class'    => 'Proc',
      'mrb->string_class'  => 'String',
      'mrb->array_class'   => 'Array',
      'mrb->hash_class'    => 'Hash',
      'mrb->float_class'   => 'Float',
      'mrb->fixnum_class'  => 'Fixnum',
      'mrb->true_class'    => 'TrueClass',
      'mrb->false_class'   => 'FalseClass',
      'mrb->nil_class'     => 'NilClass',
      'mrb->symbol_class'  => 'Symbol',
      'mrb->kernel_module' => 'Kernel'
    }

    def namespace_for_variable(var)
      return DEFAULT_NAMESPACES[var] if DEFAULT_NAMESPACES[var]
      super
    end

  end
end
