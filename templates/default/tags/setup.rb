def init
  super
end

def param
  super || tag(:param) if object.type == :function
end
