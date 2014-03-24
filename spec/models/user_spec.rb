require 'spec_helper'

describe User do
	let(:user) {FactoryGirl.create(:user)}

	subject { user }

	it {should have_many(:products)}
	it {should have_many(:favorites)}
	it {should have_many(:feeds)}
	it {should have_many(:new_infos)}

	it {should have_db_column(:email).of_type(:string).with_options(null: false)}
end
