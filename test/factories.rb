# frozen_string_literal: true

FactoryBot.define do
  sequence :vin do |n|
    "1HFSC0206CA#{6.times.map { rand(n) }.join}"[0..17]
  end

  factory :vehicle do
    vin { generate(:vin) }
    year { (1990..2019).to_a.sample }
    association :vehicle_trim
    association :vehicle_model
    association :vehicle_make
  end

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
