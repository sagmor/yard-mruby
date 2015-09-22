describe Sample::Test do
  it "foos" do
    expect(subject.foo).to eq "bar"
  end
end

describe Sample::Hello do
  it "salutes" do
    expect(subject.world).to eq "Hello World!"
  end
end
