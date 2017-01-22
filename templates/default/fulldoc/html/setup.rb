def init
  super

   YARD::MRuby::CodeObjects::HEADERS_ROOT.tap do |root|

     # Generates the requirements splash page with the 'include' template
     serialize root

     root.headers.each do |header|
       serialize header
     end
   end

end

def generate_header_list
  headers = Registry.all(:header)
  headers_ordered_by_name = headers.sort {|x,y| x.name.to_s <=> y.name.to_s }
  generate_full_list headers_ordered_by_name, :headers
end

def generate_function_list
  functions = Registry.all(:function)
  functions_ordered_by_name = functions.sort {|x,y| x.name.to_s <=> y.name.to_s }
  generate_full_list functions_ordered_by_name, :functions
end

# Helpler method to generate a full_list page of the specified objects with the
# specified type.
def generate_full_list(objects,type,options = {})
  defaults = { :list_title => "#{type.to_s.capitalize} List",
    :css_class => "class",
    :list_filename => "#{type.to_s.gsub(/s$/,'')}_list.html" }

  options = defaults.merge(options)

  @items = objects
  @list_type = type
  @list_title = options[:list_title]
  @list_class = options[:css_class]
  asset options[:list_filename], erb(:full_list)
end

#
# @note This method overrides YARD's default template class_list method.
#
# The existing YARD 'Class List' search field contains all the YARD namespace objects.
# We, however, do not want the Include Namespace YARD Object (which holds the headers)
# as it is a meta-object.
#
# This method removes the namespace from the root node, generates the class list,
# and then adds it back into the root node.
#
def class_list(root = Registry.root, tree = TreeContext.new)
  return super unless root == Registry.root

  include_namespace = YARD::MRuby::CodeObjects::HEADERS_ROOT
  root.instance_eval { children.delete include_namespace }
  out = super(root)
  root.instance_eval { children.push include_namespace }
  out
end
