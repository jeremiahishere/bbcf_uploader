require 'spec_helper'

describe "instruments/new.html.haml" do
  before(:each) do
    assign(:instrument, stub_model(Instrument,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new instrument form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => instruments_path, :method => "post" do
      assert_select "input#instrument_name", :name => "instrument[name]"
    end
  end
end
