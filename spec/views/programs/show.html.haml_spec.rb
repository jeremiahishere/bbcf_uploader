require 'spec_helper'

describe "programs/show.html.haml" do
  before(:each) do
    @program = assign(:program, stub_model(Program,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
