require 'spec_helper'

describe "goals/edit" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :match_id => 1,
      :goaler_id => 1,
      :assister_id => 1
    ))
  end

  it "renders the edit goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path(@goal), :method => "post" do
      assert_select "input#goal_match_id", :name => "goal[match_id]"
      assert_select "input#goal_goaler_id", :name => "goal[goaler_id]"
      assert_select "input#goal_assister_id", :name => "goal[assister_id]"
    end
  end
end
