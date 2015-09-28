require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Header::DefineHandler do
  it "should register defines" do
    header_line <<-eof
      # define MRB_FOO bar
    eof

    puts Registry.send(:thread_local_store).inspect
    expect(Registry.at('MRB_FOO')).not_to be_nil
  end

  it "should find docstrings attached to defines" do
    header_line <<-eof
      /* DOCSTRING */
      # define MRB_FOO bar
    eof

    define = Registry.at('MRB_FOO')
    expect(define.docstring).to eq 'DOCSTRING'
  end
end
