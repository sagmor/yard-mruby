include T('default/module')
include YARD::MRuby::Templates::Helpers::HTMLHelper

def init
  sections :header, :pre_docstring, T('docstring'), :includes,
    :function_summary, [:item_summary],
    :define_summary, [T('docstring')],
    :typedef_summary, [T('docstring')],
    :function_details_list, [T('function_details')]
end


def function_listing
  return @funcs if @funcs

  @funcs = object.functions
  @funcs
end

def define_listing
  return @defines if @defines

  @defines = object.defines
  @defines
end

def typedef_listing
  return @typedefs if @typedefs

  @typedefs = object.typedefs
  @typedefs
end
