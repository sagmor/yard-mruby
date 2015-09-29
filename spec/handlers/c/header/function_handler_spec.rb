require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Header::FunctionHandler do
  it "should register functions" do
    header_line <<-eof
      MRB_API void mrb_foo( void );
    eof
    expect(Registry.at('mrb_foo')).not_to be_nil
  end

  it "should find docstrings attached to functions" do
    header_line <<-eof
      /* DOCSTRING */
      MRB_API void mrb_foo( void );
    eof

    foo = Registry.at('mrb_foo')
    expect(foo.docstring).to eq 'DOCSTRING'
  end

  it "should store the return type" do
    header_line <<-eof
      MRB_API mrb_value mrb_foo( void );
    eof

    foo = Registry.at('mrb_foo')
    expect(foo.tag(:return).types).to eq ['mrb_value']
  end

  it "should keep return type independently from docs" do
    header_line <<-eof
      /**
       * @return DOCSTRING
       */
      MRB_API mrb_value mrb_foo( void );
    eof

    foo = Registry.at('mrb_foo')
    expect(foo.tag(:return).text).to eq 'DOCSTRING'
    expect(foo.tag(:return).types).to eq ['mrb_value']
  end
end
