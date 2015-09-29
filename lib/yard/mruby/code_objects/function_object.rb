module YARD::MRuby::CodeObjects

  # A FunctionObject represents a MRuby C API function declaration inside a header inside an include directory
  class FunctionObject < HeaderBaseObject
    ParameterType = Struct.new(:type,:name)

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
      @return_type
    end

    def return_type=(type)
      @return_type = (type == 'void' ? nil : type)
    end

    # Returns the list of parameters parsed out of the method signature
    # with their default values.
    #
    # @return [Array<Array(String, String)>] a list of parameter names followed
    #   by their default values (or nil)
    def parameters
      parameter_types.map{|t| [(t.type == '...' ? '...' : t.name), nil] }
    end

    def parameter_types
      @parameter_types || []
    end

    def parse_parameter_types(parameters)
      @parameter_types = []
      return if parameters.match /^\s*void\s*$/

      parameters.split(',').each do |parameter|
        parameter.scan(/((?:const\s+)?(?:struct\s+)?(?:\w+|\.\.\.)(?:\s*\*)?)\s*(\w+)?/) do |type,name|
          @parameter_types << ParameterType.new(type,name)
        end
      end

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

