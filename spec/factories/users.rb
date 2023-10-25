FactoryBot.define do
  factory :user do
    # Assuming User has fields like email and password
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { "password123" }
    is_admin { false } # default to false

    trait :admin do
      is_admin { true }
    end
  end
end
