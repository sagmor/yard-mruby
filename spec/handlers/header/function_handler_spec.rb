require_relative 'spec_helper'

describe YARD::MRuby::Handlers::Header::FunctionHandler do
  it "should register functions" do
    header_line <<-eof
      MRB_API void mrb_foo( void );
    eof
    expect(Registry.at('mrb_foo')).not_to be_nil

    # puts Registry.send(:thread_local_store).inspect
  end
end
