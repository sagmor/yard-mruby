module YARD::MRuby::Handlers
  module C
    module Header
      class Base < YARD::Handlers::C::Base
        include YARD::MRuby::CodeObjects

        def header(path)
          # Remove include prefix
          path = path.gsub(/^.*include\//,'')

          headers[path] ||= begin
                              header = HeaderObject.new(HEADERS_ROOT, path)
                              register header
                              header
                            end


        end

        def headers
          globals.mruby_headers ||= {}
        end

      end

    end

    YARD::Handlers::Processor.register_handler_namespace :header, Header
  end
end
