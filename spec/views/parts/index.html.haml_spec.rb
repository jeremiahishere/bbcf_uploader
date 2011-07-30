require 'spec_helper'

describe "parts/index.html.haml" do
  before(:each) do
    assign(:parts, [
      stub_model(Part,
        :instrument_id => 1,
        :description => "MyText"
      ),
      stub_model(Part,
        :instrument_id => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
