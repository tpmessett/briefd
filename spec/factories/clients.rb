require 'faker'


FactoryBot.define do
  factory :client do
    name { "Client #{Faker::Company.name}" }
    compulsory_fields { { "key1" => Faker::Lorem.word, "key2" => Faker::Number.number(digits: 4) }.to_json }
    notes { Faker::Lorem.paragraph }
    archived_at { nil }
    company
  end
end

