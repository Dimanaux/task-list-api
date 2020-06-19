require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'associations' do
    it { is_expected.to have_many :todos }
  end
end
