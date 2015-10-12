module YARD::MRuby::Handlers::C::Header
  class TypedefHandler < Base
    MATCH = /
      typedef
      (\s+(\*)?([A-Za-z0-9_\*]+))+
      ;
    /mx


    handles MATCH
    statement_class ToplevelStatement

    process do
      handle_typedef(statement)
    end

    def handle_typedef(statement)
      header = self.header(statement.file)

      statement.source.scan(MATCH) do |match|
      name = match.last
        register TypedefObject.new(header, name) do |obj|
          if statement.comments
            register_docstring(obj, statement.comments.source, statement)
          end
        end
      end

    end
  end
end
