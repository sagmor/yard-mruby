module YARD::MRuby::Handlers::C
  class ClassHandler < Base

    TOP_LEVEL_CLASS = /([\w]+)\s*=\s*mrb_define_class\s*
      \(
      \s*\w+\s*,
      \s*"(\w+)"\s*,
      \s*([\w\->]+)\s*
      \)
    /mx

    NAMESPACED_CLASS = /([\w]+)\s*=\s*mrb_define_class_under\s*
      \(
      \s*\w+\s*,
      \s*(\w+)\s*,
      \s*"(\w+)"\s*,
      \s*([\w\->]+)\s*
      \)
    /mx

    handles TOP_LEVEL_CLASS
    handles NAMESPACED_CLASS

    statement_class BodyStatement

    process do
      statement.source.scan(TOP_LEVEL_CLASS) do |var_name, class_name, parent|
        handle_class(var_name, class_name, parent, statement)
      end
      statement.source.scan(NAMESPACED_CLASS) do |var_name, in_module, class_name, parent|
        handle_class(var_name, class_name, parent, statement, in_module)
      end
    end
  end
end
