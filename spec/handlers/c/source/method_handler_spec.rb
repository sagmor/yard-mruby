require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Source::MethodHandler  do
  it "should register methods" do
    parse_init <<-eof
      mFoo = mrb_define_module(mrb, "Foo");
      mrb_define_method(mrb, mFoo, "bar", bar, MRB_ARGS_NONE());
    eof
    expect(Registry.at('Foo#bar')).not_to be_nil
    expect(Registry.at('Foo#bar').visibility).to be :public
  end

  it "should register singleton methods" do
    parse_init <<-eof
      mFoo = mrb_define_module("Foo");
      mrb_define_singleton_method(mrb, mFoo, "bar", bar, MRB_ARGS_NONE());
    eof
    expect(Registry.at('Foo.bar')).not_to be_nil
    expect(Registry.at('Foo.bar').visibility).to be :public
  end

  it "should register module functions" do
    parse <<-eof
      /* DOCSTRING
       * @return [String] foo!
       */
      static mrb_value bar(mrb_state *mrb, mrb_value self) { x(); y(); z(); }

      void mrb_foo_gem_init(mrb_state *mrb) {
        mFoo = mrb_define_module(mrb, "Foo");
        mrb_define_module_function(mrb, mFoo, "bar", bar, MRB_ARGS_NONE());
      }
    eof
    bar_c = Registry.at('Foo.bar')
    bar_i = Registry.at('Foo#bar')

    expect(bar_c).to be_module_function
    expect(bar_c.visibility).to be :public
    expect(bar_c.docstring).to eq "DOCSTRING"
    expect(bar_c.tag(:return).object).to eq bar_c
    expect(bar_c.source).to eq "static mrb_value bar(mrb_state *mrb, mrb_value self) { x(); y(); z(); }"
    expect(bar_i).not_to be_module_function
    expect(bar_i.visibility).to be :private
    expect(bar_i.docstring).to eq "DOCSTRING"
    expect(bar_i.tag(:return).object).to eq bar_i
    expect(bar_i.source).to eq bar_c.source
  end
end
