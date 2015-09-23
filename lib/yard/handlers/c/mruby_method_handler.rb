module YARD::Handlers::C
  class MRubyMethodHandler < MRubyBase
    MATCH1 = /mrb_define_method\s*
      \(
      \s*\w+\s*,
      \s*(\w+)\s*,
      \s*"(\w+)"\s*,
      \s*(\w+)\s*,
    /mx

    handles MATCH1
    statement_class BodyStatement

    process do
      statement.source.scan(MATCH1) do |var_name, name, func_name|
        handle_method(nil, var_name, name, func_name)
      end
    end

  end
end
