require 'spec_helper'

describe "parts/edit.html.haml" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :instrument_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parts_path(@part), :method => "post" do
      assert_select "input#part_instrument_id", :name => "part[instrument_id]"
      assert_select "textarea#part_description", :name => "part[description]"
    end
  end
end
