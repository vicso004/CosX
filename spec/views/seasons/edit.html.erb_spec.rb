require 'spec_helper'

describe "seasons/edit" do
  before(:each) do
    @season = assign(:season, stub_model(Season,
      :period => "MyString",
      :year => 1
    ))
  end

  it "renders the edit season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path(@season), :method => "post" do
      assert_select "input#season_period", :name => "season[period]"
      assert_select "input#season_year", :name => "season[year]"
    end
  end
end
