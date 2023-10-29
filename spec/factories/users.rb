FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { "password123" }
    is_admin { false } # default to false
    first_name { "John" }
    last_name { "Doe" }
    position { "Developer" }
    user_type { "standard" }
    provider { "provider_name" }

    trait :admin do
      is_admin { true }
    end
  end
end
