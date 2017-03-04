require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryGirl.create(:game, name: 'My Container', container_weeks: 5) }

  it 'creates container and additional games when container_weeks included' do
    expect(game).to be_persisted
    expect(Container.count).to eq 1
    expect(Container.first.games.count).to eq 5
  end
end
