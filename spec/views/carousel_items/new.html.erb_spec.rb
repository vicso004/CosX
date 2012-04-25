require 'spec_helper'

describe "carousel_items/new" do
  before(:each) do
    assign(:carousel_item, stub_model(CarouselItem,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new carousel_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => carousel_items_path, :method => "post" do
      assert_select "input#carousel_item_url", :name => "carousel_item[url]"
    end
  end
end
