require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Source::ModuleHandler do
  it "should register modules" do
    parse_init 'mFoo = mrb_define_module(mrb, "Foo");'
    expect(Registry.at('Foo').type).to be :module
  end

  it "should register modules under namespaces" do
    parse_init 'mFoo = mrb_define_module_under(mrb, mBar, "Foo");'
    expect(Registry.at('Bar::Foo').type).to be :module
  end

  it "should remember symbol defined with module" do
    parse_init(<<-eof)
      cXYZ = mrb_define_module(mrb, "Foo");
      mrb_define_method(mrb, cXYZ, "bar", bar, 0);
    eof
    expect(Registry.at('Foo').type).to be :module
    expect(Registry.at('Foo#bar')).not_to be_nil
  end

  it "should associate declaration comments as module docstring" do
    parse_init(<<-eof)
      /* Docstring! */
      mFoo = mrb_define_module(mrb, "Foo");
    eof
    expect(Registry.at('Foo').docstring).not_to be_blank
  end
end
