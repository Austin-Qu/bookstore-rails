require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'creation' do
    before do
      @book = FactoryBot.create(:book)
    end

    it 'can be created' do
      expect(@book).to be_valid
    end

    it 'cannot be created without a title' do
      @book.title = nil
      expect(@book).to_not be_valid
    end
  end
end
