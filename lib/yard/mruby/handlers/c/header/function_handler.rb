module YARD::MRuby::Handlers::C::Header
  class FunctionHandler < Base
    MATCH = /
      MRB_(API|INLINE)\s+
      ((struct\s+)?\w+(\s*\*)?)\s*
      ((\w+\s+)+)?(\w+)\s*\(
    /mx
      #\(([\w\*,]*)\)

    handles MATCH
    statement_class ToplevelStatement

    process do
      handle_function(statement)
    end

    def handle_function(statement)
      header = self.header(statement.file)

["API", "mrb_value", nil, nil, nil, nil, "sample_api_method"]
      statement.source.scan(MATCH) do |type, retype, _,_,_,_, name, *args|
        puts args.inspect
        register FunctionObject.new(header, name) do |obj|
          if statement.comments
            register_docstring(obj, statement.comments.source, statement)
          end

          if retype != 'void'
            obj.add_tag(YARD::Tags::Tag.new(:return,"", "")) unless obj.has_tag?(:return)
            obj.tag(:return).types = [retype] 
          end

        end
      end
    end
  end
end
