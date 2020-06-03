FactoryBot.define do
  factory :item do
    id {1}
    user_id {1}
    name {"お茶"}
    description {"美味しいよ"}
    category_id {5}
    condition_id {1}
    postage_payment_id {1}
    ship_from_id {1}
    preparation_id {1}
    price {1000}

    after(:build) do |item|
      item.images << build_list(:image, 10)
    end
  end
end