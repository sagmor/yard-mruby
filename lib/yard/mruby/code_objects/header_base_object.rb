module YARD::MRuby::CodeObjects

  # A FunctionObject represents a MRuby C API function declaration inside a header inside an include directory
  class HeaderBaseObject < YARD::CodeObjects::Base

    def header
      self.namespace
    end

    # Header objects's shouln't be namespaced
    def path
      self.name.to_s
    end
  end
end
