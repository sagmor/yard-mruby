module YARD::MRuby::CodeObjects

  # A HeaderObject represents a MRuby header inside an include directory
  # It groups C Functions and define macros.
  class HeaderObject < YARD::CodeObjects::NamespaceObject
    def functions
      children.find_all {|d| d.is_a?(FunctionObject) } 
    end

    def defines
      children.find_all {|d| d.is_a?(DefineObject) } 
    end

    def typedefs
      children.find_all {|d| d.is_a?(TypedefObject) }
    end

    def path
      self.name
    end

    def title
      super.to_s
    end

    def inheritance_tree(*args)
      return [self]
    end
  end
end
