FactoryGirl.define do
	  factory :user do
      sequence(:email) { |n| "shiljos#{n}@example.com" }
      password "12345678" 
      password_confirmation "12345678"
    end  

    factory :product do
      sequence(:name) { |n| "Product #{n}" }
      description "Description"
      warning ""
    end

    factory :favorite do
      association :product
      association :user
    end

    factory :category do
      sequence(:name) { |n| "Category #{n}"}
      product
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

    factory :ingredient do
      name "Voda"
    end

    factory :product_ingredient do
      association :product
      association :ingredient
    end

    factory :company do
      sequence(:name) { |n| "Company #{n}" }
      country "USA"
      city "NY"
    end

    factory :distributer do
      association :product
      association :company
    end

    factory :manufacturer do
      association :product
      association :company
    end

    factory :new_info do
      info "blablablainfoinfo"
      product
    end

    factory :feed do
      new_info
      user
    end
end