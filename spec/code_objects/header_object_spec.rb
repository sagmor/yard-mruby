require_relative 'spec_helper'

describe YARD::MRuby::CodeObjects::HeaderObject do
  before { Registry.clear }

  it "should return the name of the header for the path" do
    header_object = YARD::MRuby::CodeObjects::HeaderObject.new(nil, :"mruby.h")
    expect(header_object.path).to eq("mruby.h")
  end
end
