require 'spec_helper'

describe "carousel_items/edit" do
  before(:each) do
    @carousel_item = assign(:carousel_item, stub_model(CarouselItem,
      :url => "MyString"
    ))
  end

  it "renders the edit carousel_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carousel_items_path(@carousel_item), :method => "post" do
      assert_select "input#carousel_item_url", :name => "carousel_item[url]"
    end
  end
end
