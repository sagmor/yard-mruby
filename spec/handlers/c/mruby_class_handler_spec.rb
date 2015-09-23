require_relative 'spec_helper'

describe YARD::Handlers::C::MRubyClassHandler do
  it "should register classes" do
    parse_init 'cFoo = mrb_define_class(mrb, "Foo", mrb->object_class);'

    expect(Registry.at('Foo').type).to be :class
  end

  it "should register classes under namespaces" do
    parse_init 'cFoo = mrb_define_class_under(mrb, cBar, "Foo", rb_cObject);'
    expect(Registry.at('Bar::Foo').type).to be :class
  end

  it "should remember symbol defined with class" do
    parse_init(<<-eof)
      cXYZ = mrb_define_class(mrb, "Foo", mrb->object_class);
      mrb_define_method(mrb, cXYZ, "bar", bar, MRB_ARGS_NONE());
    eof
    expect(Registry.at('Foo').type).to be :class
    expect(Registry.at('Foo#bar')).not_to be_nil
  end

  it "should lookup superclass symbol name" do
    parse_init(<<-eof)
      cXYZ = mrb_define_class(mrb,"Foo", mrb->object_class);
      cBar = mrb_define_class(mrb,"Bar", cXYZ);
    eof
    expect(Registry.at('Bar').superclass).to eq Registry.at('Foo')
  end

end
