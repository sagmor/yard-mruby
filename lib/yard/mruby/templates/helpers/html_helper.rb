module YARD::MRuby::Templates
  module Helpers
    # Helper methods for text template formats.
    module HTMLHelper

      def fsignature(func, link = true, show_extras = true)
        name = func.name
        title = "<strong>%s</strong>" % [h(name)]

        if link
          url = url_for(func)
          link_url(url, title, :title => title)
        else
          title
        end
      end

    end
  end
end
