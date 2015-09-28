module YARD::MRuby::Handlers::C::Header
  class DefineHandler < Base
    MATCH = /
      \#\s*define\s*(\w+)
    /mx

    handles MATCH
    statement_class YARD::MRuby::Parser::C::DirectiveStatement

    process do
      header = self.header(statement.file)

      statement.declaration.scan(MATCH) do |match|
        register DefineObject.new(header, match.first) do |obj|
          if statement.comments
            register_docstring(obj, statement.comments.source, statement)
          end
        end
      end

    end
  end
end
