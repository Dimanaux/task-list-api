FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "Project ##{n}" }
    todos { [] }
  end
end
