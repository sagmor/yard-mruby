module YARD::MRuby::CodeObjects

  # A FunctionObject represents a MRuby C API function declaration inside a header inside an include directory
  class FunctionObject < YARD::CodeObjects::Base
    def initialize(header, name, &block)
      super
    end

    # Function's shouln't be namespaced
    def path
      self.name
    end
  end
end

