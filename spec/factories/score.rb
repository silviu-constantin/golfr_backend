FactoryBot.define do
  factory :score do
    total_score { 80}
    played_at { '2022-07-26' }
    number_of_holes { 9 }
  end
end
