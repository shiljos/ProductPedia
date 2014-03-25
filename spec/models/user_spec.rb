require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.create(:user)}

  subject { user }

  it {should have_many(:favorites)}
  it {should have_many(:products).through(:favorites)}
  it {should have_many(:owned_products).class_name("Product")}

  it {should have_db_column(:email).of_type(:string).with_options(null: false)}
end
