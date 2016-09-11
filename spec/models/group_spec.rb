require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:u1) { FactoryGirl.create(:user) }
  let(:u2) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group) }

  it 'can add participants' do
    puts u1.inspect
    puts u2.inspect
    group.participants = [u1, u2]
    expect(group.participants.size).to eq 2
  end
end
