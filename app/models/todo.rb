class Todo < ApplicationRecord
  belongs_to :project

  alias_attribute(:completed?, :is_completed)

  validates_presence_of :text
end
