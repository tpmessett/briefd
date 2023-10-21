FactoryBot.define do
  factory :company do
    name { "Test Company" }
    plan { "Basic" }
    business_field { "Tech" }
    business_type { "SaaS" }
  end
end
