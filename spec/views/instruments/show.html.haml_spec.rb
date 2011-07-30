require 'spec_helper'

describe "instruments/show.html.haml" do
  before(:each) do
    @instrument = assign(:instrument, stub_model(Instrument,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
