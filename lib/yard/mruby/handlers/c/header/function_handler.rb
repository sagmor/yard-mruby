module YARD::MRuby::Handlers::C::Header
  class FunctionHandler < Base
    MATCH = /
      MRB_(API|INLINE)\s+
      ((struct\s+)?\w+(\s*\*)?)\s*
      ((\w+\s+)+)?(\w+)\s*
      \(([\w\s\*,\.]*)\)
    /mx

    handles MATCH
    statement_class ToplevelStatement

    process do
      handle_function(statement)
    end

    def handle_function(statement)
      header = self.header(statement.file)

      statement.source.scan(MATCH) do |type, retype, _,_,_,_, name, parameters|
        register FunctionObject.new(header, name) do |obj|
          if statement.comments
            register_docstring(obj, statement.comments.source, statement)
          end

          obj.return_type = retype
          obj.parse_parameter_types(parameters)

        end
      end
    end
  end
end
