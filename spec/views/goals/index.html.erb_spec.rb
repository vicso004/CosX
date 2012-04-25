require 'spec_helper'

describe "goals/index" do
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :match_id => 1,
        :goaler_id => 2,
        :assister_id => 3
      ),
      stub_model(Goal,
        :match_id => 1,
        :goaler_id => 2,
        :assister_id => 3
      )
    ])
  end

  it "renders a list of goals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
