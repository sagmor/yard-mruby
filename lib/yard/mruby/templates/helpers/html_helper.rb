module YARD::MRuby::Templates
  module Helpers
    # Helper methods for text template formats.
    module HTMLHelper

      def fsignature(func, link = true, show_extras = true)
        name = func.name
        prefix = 'void'
        params = 'void'
        title = "%s <strong>%s</strong>( %s )" % [h(prefix), h(name), h(params)]

        if link
          url = url_for(func)
          link_url(url, title, :title => name)
        else
          title
        end
      end

    end
  end
end
