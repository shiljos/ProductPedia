FactoryGirl.define do
	factory :user do
      sequence(:email) { |n| "shiljos#{n}@example.com" }
      sequence(:password) { |n| "user#{n}user" }
    end  

    factory :product do
      sequence(:name) { |n| "Product #{n}" }
      sequence(:description) { |n| "product_#{n} description"}
    end
end