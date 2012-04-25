require 'spec_helper'

describe "carousel_items/show" do
  before(:each) do
    @carousel_item = assign(:carousel_item, stub_model(CarouselItem,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
