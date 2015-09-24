def init
  super
end

#
# Append yard-cucumber stylesheet to yard core stylesheets
#
def stylesheets
  super + %w(css/mruby.css)
end

#
# Append yard-cucumber javascript to yard core javascripts
#
def javascripts
  super + %w(js/mruby.js)
end

#
# Append yard-cucumber specific menus 'features' and 'tags'
#
# 'features' and 'tags' are enabled by default.
#
# 'step definitions' and 'steps' may be enabled by setting up a value in
# yard configuration file '~/.yard/config'
#
# @example `~/.yard.config`
#
#     yard-cucumber:
#       menus: [ 'features', 'directories', 'tags', 'step definitions', 'steps' ]
#
def menu_lists

  [ {
    type: 'header',
    title: 'C API',
    search_title: 'C API'
  } ] + super

end

