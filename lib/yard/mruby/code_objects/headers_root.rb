module YARD::MRuby::CodeObjects

  class HeadersRoot < YARD::CodeObjects::NamespaceObject
    def headers
      children
    end

    def inheritance_tree(*args)
      return [self]
    end
  end

  HEADERS_ROOT = HeadersRoot.new(:root, "headers")
end
