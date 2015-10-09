module YARD::MRuby::CLI
  module Yardoc

    # Redefines default files for YARD::CLI::Yardoc
    def parse_arguments(*args)
      super(*args)
      self.files = %w{src/**/*.c mrblib/**/*.rb include/**/*.h} if self.files.empty?
    end
  end

  # Load Above modifications into YARD::CLI::Yardoc
  YARD::CLI::Yardoc.include Yardoc
end

