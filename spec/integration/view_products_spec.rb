require 'spec_helper'

feature "Products list" do
  scenario "allows user to see all products" do
    visit products_path
  end
end