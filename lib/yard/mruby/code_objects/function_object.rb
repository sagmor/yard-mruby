module YARD::MRuby::CodeObjects

  # A FunctionObject represents a MRuby C API function declaration inside a header inside an include directory
  class FunctionObject < YARD::CodeObjects::Base

    # Returns the list of parameters parsed out of the method signature
    # with their default values.
    #
    # @return [Array<Array(String, String)>] a list of parameter names followed
    #   by their default values (or nil)
    attr_accessor :parameters

    def initialize(header, name, &block)
      super
    end

    def header
      self.namespace
    end

    # Function's shouln't be namespaced
    def path
      self.name.to_s
    end

    def attr_info
      nil
    end

    def scope
      ''
    end

    # Returns all alias names of the object
    # @return [Array<Symbol>] the alias names
    def aliases
      list = []
      return list unless namespace.is_a?(HeaderObject)
      namespace.aliases.each do |o, aname|
        list << o if aname == name && o.scope == scope
      end
      list
    end
  end
end

