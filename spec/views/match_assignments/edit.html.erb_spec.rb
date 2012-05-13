require 'spec_helper'

describe "match_assignments/edit" do
  before(:each) do
    @match_assignment = assign(:match_assignment, stub_model(MatchAssignment,
      :player_id => 1,
      :match_id => 1,
      :confirmed => false
    ))
  end

  it "renders the edit match_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => match_assignments_path(@match_assignment), :method => "post" do
      assert_select "input#match_assignment_player_id", :name => "match_assignment[player_id]"
      assert_select "input#match_assignment_match_id", :name => "match_assignment[match_id]"
      assert_select "input#match_assignment_confirmed", :name => "match_assignment[confirmed]"
    end
  end
end
