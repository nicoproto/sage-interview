require 'rails_helper'

RSpec.describe Query, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:kind) }
  end
end
