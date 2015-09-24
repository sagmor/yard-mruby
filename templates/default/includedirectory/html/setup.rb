def init
  super
  sections.push :headers_list

  @namespace = object
end

def headers
  object.headers
end
