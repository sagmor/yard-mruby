module YARD::MRuby::CodeObjects

  class HeadersRoot < YARD::CodeObjects::NamespaceObject
    def headers
      children
    end
  end

  HEADERS_ROOT = HeadersRoot.new(:root, "headers")

end
