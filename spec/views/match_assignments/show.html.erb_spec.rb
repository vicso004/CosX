require 'spec_helper'

describe "match_assignments/show" do
  before(:each) do
    @match_assignment = assign(:match_assignment, stub_model(MatchAssignment,
      :player_id => 1,
      :match_id => 2,
      :confirmed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
