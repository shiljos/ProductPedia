FactoryGirl.define do
	  factory :user do
      email {Faker::Internet.email}
      password "12345678" 
      password_confirmation "12345678"
    end  

    factory :product do
      name {Faker::Product.product_name}
      description "Some Description"
      warning ""
      category
    end


    factory :favorite do
      association :product
      association :user
    end

    factory :category do
      sequence(:name) { |n| "Category #{n}"}
    end

    factory :bar_code do
      barcode "1234567890981"
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
      name { Faker::Company.name }
      country {Faker::Address.country}
      city {Faker::Address.city}
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
      info { Faker::Lorem.sentence }
      product
    end
end