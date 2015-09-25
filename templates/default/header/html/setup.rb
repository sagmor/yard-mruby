def init
  super

  sections.push :header
  sections.push :function_summary
end


def function_listing
  return @funcs if @funcs

  @funcs = object.functions
  @funcs
end

