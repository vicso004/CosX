require 'spec_helper'

describe "seasons/index" do
  before(:each) do
    assign(:seasons, [
      stub_model(Season,
        :period => "Period",
        :year => 1
      ),
      stub_model(Season,
        :period => "Period",
        :year => 1
      )
    ])
  end

  it "renders a list of seasons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Period".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
