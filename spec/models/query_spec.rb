require 'rails_helper'

RSpec.describe Query, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:kind) }
    it { should validate_length_of(:input).is_at_least(3)}
  end
end
