# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_make do
    sequence(:name) { |n| "Ford#{n}" }
  end

  factory :vehicle_model do
    sequence(:name) { |n| "Expedition#{n}" }
    association :vehicle_make
  end

  factory :vehicle_trim do
    sequence(:name) { |n| "Bauer#{n}" }
    association :vehicle_model
  end
end
