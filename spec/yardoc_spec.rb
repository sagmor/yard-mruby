require "spec_helper"

describe YARD::CLI::Yardoc do
  before do
    @yardoc = YARD::CLI::Yardoc.new
    @yardoc.parse_arguments
  end

  it "should use mrblib/**/*.rb src/**/*.c include/**/*.h as default file glob" do
    expect(@yardoc.files).to eq %w{mrblib/**/*.rb src/**/*.c include/**/*.h}
  end
end
