require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:u1) { FactoryGirl.create(:user) }
  let(:u2) { FactoryGirl.create(:user) }
  let(:u3) { FactoryGirl.create(:user) }
  let(:u4) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group, participants: [u1, u2, u3, u4]) }

  it { should respond_to(
    :second_activity,
    :participants_except,
    :game,
    :starting,
    :available_players
  )}

  it '#participants_except works' do
    expect(group.participants.size).to eq 4
    expect(group.participants_except(u3)).to match_array [u1, u2, u4]
  end

end
