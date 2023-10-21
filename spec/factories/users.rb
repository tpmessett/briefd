FactoryBot.define do
  factory :user do
    # Assuming User has fields like email and password
    email { "test@example.com" }
    password { "password123" }
    is_admin { false } # default to false

    trait :admin do
      is_admin { true }
    end
  end
end
