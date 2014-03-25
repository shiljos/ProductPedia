require 'spec_helper'

describe Ingredient do
  it { should have_many(:product_ingredients) }
  it { should have_many(:products).through(:product_ingredients)}
end
