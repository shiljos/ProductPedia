require 'spec_helper'

describe Product do
	let(:product) {FactoryGirl.create(:product)}

	subject {product}

	it {should respond_to(:name)}
	it {should respond_to(:description)}
	it {should respond_to(:warning)}

	it { should validate_presence_of(:name) }
	it { should have_many(:users)}
	it { should have_many(:favorites)}
	it { should have_many(:bar_codes)}
	it { should have_many(:product_nuts)}
	it { should have_many(:nutritions)}
	it { should have_many(:product_ingredients)}
	it { should have_many(:ingredients)}
	it { should have_many(:categories)}
	it { should have_many(:distributers)}
	it { should have_many(:companies)}
	it { should have_many(:new_infos)}
	it { should have_many(:manufacturers)}


end
