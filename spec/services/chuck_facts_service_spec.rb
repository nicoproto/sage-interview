require 'rails_helper'

RSpec.describe ChuckFactsService, type: :model do
  describe '#call' do
    context 'searching random fact' do
      it 'should return a random fact' do
        fact = ChuckFactsService.call('random')

        expect(fact.count).to eq(1)
      end
    end

    context 'searching by words' do
      context 'with valid query' do
        it 'should return a non-empty array of facts' do
          fact = ChuckFactsService.call('words', 'cat')

          expect(fact.count).to be > 0
        end
      end

      context 'with invalid query' do
        it 'should return an empty array if query not found' do
          fact = ChuckFactsService.call('words', 'xzer')

          expect(fact.count).to eq(0)
        end

        it 'should return false if the query is too short' do
          fact = ChuckFactsService.call('words', 'co')

          expect(fact).to eq(false)
        end
      end
    end

    context 'searching by category' do
      it 'should return array of facts from selected category' do
        fact = ChuckFactsService.call('category', 'animal')

        expect(fact.count).to be > 0
      end
    end
  end
end