module YARD::MRuby::CodeObjects

  class NamespaceObject < YARD::CodeObjects::NamespaceObject
    def value ; nil ; end
  end

  class IncludeDirectory < NamespaceObject
    def headers
      children
    end
  end

  INCLUDE_DIRECTORY = IncludeDirectory.new(:root, "include")
  ## YARD::Registry.register INCLUDE_DIRECTORY

end
