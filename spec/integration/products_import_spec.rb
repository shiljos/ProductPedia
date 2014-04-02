require 'spec_helper'

# describe "Import products" do
# 	it "checks if import works properly", js: true do
# 		FactoryGirl.create(:category, name: "Dressings")
# 		FactoryGirl.create(:company, name: "Boyle Inc")
# 		FactoryGirl.create(:company, name: "Reinger-Ebert")
# 		sign_in
# 		visit new_product_path
# 		expect(page).to have_content("Click below")
# 		click_link('show_id')
# 		attach_file('file', Rails.root+'spec/fixtures/test.xls')
		
# 		expect{ click_button("Import")}.to change { Product.count }.by(1)
# 	end
# end