FactoryBot.define do
  factory :todo do
    sequence(:text) { |n| "To do #{n}th thing" }
    is_completed { false }
    project
  end
end
