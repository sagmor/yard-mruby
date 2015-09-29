module YARD::MRuby::CodeObjects

  # A FunctionObject represents a MRuby C API function declaration inside a header inside an include directory
  class FunctionObject < HeaderBaseObject

    # Returns the list of parameters parsed out of the method signature
    # with their default values.
    #
    # @return [Array<Array(String, String)>] a list of parameter names followed
    #   by their default values (or nil)
    attr_accessor :parameters

    def initialize(header, name, &block)
      super
    end

    def attr_info
      nil
    end

    def scope
      ''
    end

    def return_type
      obj.tag(:return).types.first
    end

    def return_type=(type)
      return if type == 'void'
      add_tag(YARD::Tags::Tag.new(:return,"", "")) unless has_tag?(:return)
      tag(:return).types = [type]
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

