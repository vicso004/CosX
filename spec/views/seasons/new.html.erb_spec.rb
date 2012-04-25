require 'spec_helper'

describe "seasons/new" do
  before(:each) do
    assign(:season, stub_model(Season,
      :period => "MyString",
      :year => 1
    ).as_new_record)
  end

  it "renders new season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path, :method => "post" do
      assert_select "input#season_period", :name => "season[period]"
      assert_select "input#season_year", :name => "season[year]"
    end
  end
end
