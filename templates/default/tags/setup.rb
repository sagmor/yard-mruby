def init
  super

  sections << :iso
  sections << :mrbgem
end

def param
  super || tag(:param) if object.type == :function
end
