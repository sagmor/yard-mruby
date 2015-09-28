require_relative 'spec_helper'

describe YARD::MRuby::Handlers::C::Header::HeaderDeclHandler do
  it "should find docstrings attached to MRB_BEGIN_DECL tag" do
    header <<-eof, 'header.h'
      /* DOCSTRING */
      MRB_BEGIN_DECL

      MRB_END_DECL
    eof

    header = Registry.at('header.h')
    expect(header.docstring).to eq 'DOCSTRING'
  end
end
