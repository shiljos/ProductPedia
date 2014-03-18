FactoryGirl.define do
	factory :user do
      sequence(:email) { |n| "shiljos#{n}@example.com" }
      sequence(:password) { |n| "user#{n}user" }
    end  

    factory :product do
      sequence(:name) { |n| "Product #{n}" }
      sequence(:description) { |n| "product_#{n} description"}
    end

    factory :bar_code do
      barcode "123456789098"
      product
    end

    factory :nutrition do
    	name "Protein"
    end

    factory :product_nut do
    	amount "30.0"
    	association :product
    	association :nutrition
    end
end