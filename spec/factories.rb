FactoryGirl.define do
	factory :user do
      email "shiljos@example.com"
      password "shiljokralju"
    end  

    factory :product do
      sequence(:name) { |n| "Product #{n}" }
      sequence(:description) { |n| "product_#{n} description"}
    end
end