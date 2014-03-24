require 'spec_helper'

describe Company do
	let(:company) {FactoryGirl.create(:company)}

	subject { company }

	it { should have_many(:distributers) }
	it { should have_many(:distributed_products).through(:distributers).source(:product)}
	it { should have_many(:manufacturers) }
	it { should have_many(:manufactured_products).through(:manufacturers).source(:product)}


	it { should have_db_column(:name).of_type(:string).with_options(null: false) }
	it { should have_db_column(:country).of_type(:string) }
	it { should have_db_column(:city).of_type(:string) }
end
