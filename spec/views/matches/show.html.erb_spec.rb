require 'spec_helper'

describe "matches/show" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :other_team => "Other Team",
      :score_other => 1,
      :seasone_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Other Team/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
