require 'spec_helper'

feature "Created feed" do
  scenario "checks if the product news are shown in the right order" do
    sign_in
    @category = FactoryGirl.create_list(:category, 1)
    @product = FactoryGirl.create(:product, category: @category.first)
    @older_feed = FactoryGirl.create(:new_info, product: @product, created_at: 1.day.ago)
    @newer_feed = FactoryGirl.create(:new_info, product: @product, created_at: 1.hour.ago)
    product_details_init(@product)
    add_favorite_as(@user, @product)
    visit root_path
    expect(page).to have_xpath("//ul/li[1]", text: @newer_feed.info)
    expect(page).to have_xpath("//ul/li[last()]", text: @older_feed.info)
  end
end