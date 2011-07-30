require 'spec_helper'

describe "pieces/show.html.haml" do
  before(:each) do
    @piece = assign(:piece, stub_model(Piece,
      :name => "Name",
      :composer => "Composer",
      :arranger => "Arranger",
      :inventory_number => "Inventory Number",
      :version_number => "Version Number",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Composer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Arranger/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Inventory Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Version Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
