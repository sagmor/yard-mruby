require_relative 'templates/helpers'

YARD::MRuby::TEMPLATES_PATH = File.expand_path('../../../../templates', __FILE__)

# This registered template works for yardoc
YARD::Templates::Engine.register_template_path YARD::MRuby::TEMPLATES_PATH

# The following static paths and templates are for yard server
# YARD::Server.register_static_path File.join(YARD::MRuby::TEMPLATES_PATH,'default/fulldoc/html')
