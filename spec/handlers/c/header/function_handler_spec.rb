require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Header::FunctionHandler do
  subject{ Registry.at('mrb_foo') }
  it "should register functions" do
    header_line <<-eof
      MRB_API void mrb_foo( void );
    eof
    expect(subject).not_to be_nil
  end

  it "should find docstrings attached to functions" do
    header_line <<-eof
      /* DOCSTRING */
      MRB_API void mrb_foo( void );
    eof

    expect(subject.docstring).to eq 'DOCSTRING'
  end

  it "should store the return type" do
    header_line <<-eof
      MRB_API mrb_value mrb_foo( void );
    eof

    expect(subject.return_type).to eq 'mrb_value'
  end

  it "should store argument types" do
    header_line <<-eof
      MRB_API mrb_value mrb_foo( mrb_state *mrb, mrb_value bar );
    eof

    expect(subject.parameter_types.first.type).to eq 'mrb_state *'
    expect(subject.parameter_types.last.type).to eq 'mrb_value'
    expect(subject.parameter_types.last.name).to eq 'bar'
  end
end
