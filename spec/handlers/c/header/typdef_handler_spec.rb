require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Header::TypedefHandler do
  it "should register typedef" do
    header_line <<-eof
      typedef const char *mrb_args_format;
    eof

    expect(Registry.at('mrb_args_format')).not_to be_nil
  end

  it "should find docstrings attached to typedefs" do
    header_line <<-eof
      /**
       * Format specifiers for \ref mrb_get_args function
       */
      typedef const char *mrb_args_format;
    eof

    define = Registry.at('mrb_args_format')
    expect(define.docstring).to eq "Format specifiers for \ref mrb_get_args function"
  end
end
