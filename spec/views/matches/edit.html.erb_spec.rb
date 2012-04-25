require 'spec_helper'

describe "matches/edit" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :other_team => "MyString",
      :score_other => 1,
      :seasone_id => 1
    ))
  end

  it "renders the edit match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path(@match), :method => "post" do
      assert_select "input#match_other_team", :name => "match[other_team]"
      assert_select "input#match_score_other", :name => "match[score_other]"
      assert_select "input#match_seasone_id", :name => "match[seasone_id]"
    end
  end
end
