require 'spec_helper'

describe "pieces/new.html.haml" do
  before(:each) do
    assign(:piece, stub_model(Piece,
      :name => "MyString",
      :composer => "MyString",
      :arranger => "MyString",
      :inventory_number => "MyString",
      :version_number => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new piece form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pieces_path, :method => "post" do
      assert_select "input#piece_name", :name => "piece[name]"
      assert_select "input#piece_composer", :name => "piece[composer]"
      assert_select "input#piece_arranger", :name => "piece[arranger]"
      assert_select "input#piece_inventory_number", :name => "piece[inventory_number]"
      assert_select "input#piece_version_number", :name => "piece[version_number]"
      assert_select "textarea#piece_description", :name => "piece[description]"
    end
  end
end
