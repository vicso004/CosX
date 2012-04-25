require 'spec_helper'

describe "goals/show" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :match_id => 1,
      :goaler_id => 2,
      :assister_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
