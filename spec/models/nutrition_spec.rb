require 'spec_helper'

describe Nutrition do
  it { should have_many(:product_nuts) }
  it { should have_many(:products).through(:product_nuts)}
end
