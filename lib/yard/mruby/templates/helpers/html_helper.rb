module YARD::MRuby::Templates
  module Helpers
    # Helper methods for text template formats.
    module HTMLHelper

      def fsignature(func, link = true, show_extras = true)
        name = func.name
        prefix = func.return_type || 'void'
        params = if func.parameter_types.empty?
                    'void'
                  else
                    func.parameter_types.map do |t|
                      if show_extras
                        [t.type, t.name].join(' ')
                      else
                        t.type
                      end
                    end.join(', ')
                  end
        title = "%s <strong>%s</strong>(%s)" % [h(prefix), h(name), h(params)]

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
