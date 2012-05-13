require 'spec_helper'

describe "match_assignments/index" do
  before(:each) do
    assign(:match_assignments, [
      stub_model(MatchAssignment,
        :player_id => 1,
        :match_id => 2,
        :confirmed => false
      ),
      stub_model(MatchAssignment,
        :player_id => 1,
        :match_id => 2,
        :confirmed => false
      )
    ])
  end

  it "renders a list of match_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
