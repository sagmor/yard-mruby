module YARD::MRuby::Handlers::C::Header
  class HeaderDeclHandler < Base
    MATCH = /
      MRB_BEGIN_DECL
    /mx

    handles MATCH
    statement_class ToplevelStatement

    process do
      header = self.header(statement.file)

      if statement.comments
        register_docstring(header, statement.comments.source, statement)
      end
    end

  end
end

