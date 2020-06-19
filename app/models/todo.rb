class Todo < ApplicationRecord
  belongs_to :project

  alias_attribute(:completed?, :is_completed)

  validates :text, presence: true
end
