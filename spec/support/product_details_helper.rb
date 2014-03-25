module ProductDetailsHelper
  def product_details_init(product)
    @b_code = FactoryGirl.create(:bar_code, product: product)
    @company = FactoryGirl.create(:company)
    @distributer = FactoryGirl.create(:distributer, product: product, company: @company)
    @manufacturer = FactoryGirl.create(:manufacturer, product: product, company: @company)
  end
end

RSpec.configure do |config|
  config.include ProductDetailsHelper
end