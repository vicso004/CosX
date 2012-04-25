require 'spec_helper'

describe "carousel_items/index" do
  before(:each) do
    assign(:carousel_items, [
      stub_model(CarouselItem,
        :url => "Url"
      ),
      stub_model(CarouselItem,
        :url => "Url"
      )
    ])
  end

  it "renders a list of carousel_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
