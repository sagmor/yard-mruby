include YARD::MRuby::Templates::Helpers::HTMLHelper

def init
  sections :header, [:function_signature, T('docstring'), :source]
end

def source
  return if owner != object.namespace
  return if Tags::OverloadTag === object
  return if object.source.nil?
  erb(:source)
end
