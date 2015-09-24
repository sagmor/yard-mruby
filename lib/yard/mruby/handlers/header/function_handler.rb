module YARD::MRuby::Handlers::Header
  class FunctionHandler < Base
    MATCH = /
      MRB_(API|INLINE)\s+((\w+\s+)+)(\w+)\s*\(
    /mx

    handles MATCH
    statement_class ToplevelStatement

    process do
      handle_function(statement)
    end

    def handle_function(statement)
      header = self.header(statement.file)

      statement.source.scan(MATCH) do |type, prefix, _, name, *args|
        register FunctionObject.new(header, name) do |obj|
        end
      end
    end
  end
end
