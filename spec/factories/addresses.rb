FactoryBot.define do

  factory :address do
    family_name           {"田中"}
    first_name            {"太朗"}
    family_name_kana      {"たなか"}
    first_name_kana       {"たろう"}
    postal_code           {"567-0046"}
    prefecture_id         {"1"}
    city                  {"横浜"}
    block                 {"青山"}
  end

end
