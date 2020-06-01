FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"田中"}
    first_name            {"太朗"}
    family_name_kana      {"たなか"}
    first_name_kana       {"たろう"}
    birthday              {"1996-01-31"}
  end

end