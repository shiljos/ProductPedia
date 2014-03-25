require 'spec_helper'

describe Product do
	let(:product) {FactoryGirl.create(:product)}

	subject {product}

	it {should respond_to(:name)}
	it {should respond_to(:description)}
	it {should respond_to(:warning)}

	it { should have_many(:users).through(:favorites)}
	it { should have_many(:favorites)}
	it { should have_many(:bar_codes)}
	it { should have_many(:product_nuts)}
	it { should have_many(:nutritions).through(:product_nuts)}
	it { should have_many(:product_ingredients)}
	it { should have_many(:ingredients).through(:product_ingredients)}
	it { should have_many(:distributers)}
	it { should have_many(:distribution_companies).through(:distributers).source(:company)}
	it { should have_many(:new_infos)}
	it { should have_many(:manufacturers)}
	it { should have_many(:manufacture_companies).through(:manufacturers).source(:company)}
	it { should belong_to(:category)}
	it { should belong_to(:owner).class_name("User")}

	it { should have_db_column(:name).of_type(:string).with_options(null: false)}
	it { should have_db_column(:description).of_type(:string)}
end
