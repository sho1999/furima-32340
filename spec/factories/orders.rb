FactoryBot.define do
  factory :order do
    postcode        {"123-4567"}
    region_id       {3}
    city            {"世田谷区"}
    block           {"北沢2-2-12"}
    building        {"北沢4ビル N01"}
    phone_num       {"08078320987"}

    token           {"pk_test_58748ca9261a7536059050d4"}
  end
end
