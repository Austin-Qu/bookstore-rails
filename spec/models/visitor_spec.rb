require 'rails_helper'

RSpec.describe Visitor, type: :model do
  describe 'creation' do
    it 'can be created' do
      visitor = Visitor.create(remote_ip: '111.111.111.111', visit_time: Time.zone.now)
      expect(visitor).to be_valid
    end
  end
end
