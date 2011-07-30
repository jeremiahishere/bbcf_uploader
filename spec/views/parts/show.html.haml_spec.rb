require 'spec_helper'

describe "parts/show.html.haml" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :instrument_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
