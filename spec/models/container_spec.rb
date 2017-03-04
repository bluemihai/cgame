require 'rails_helper'

RSpec.describe Container, type: :model do
  let(:container) { FactoryGirl.create(:container,
    name: 'Foo', weeks: 3, starting: DateTime.new(2014, 1, 2, 17, 0, 0))
  }

  it 'generates the right number of games on creation' do
    expect(container).to be_persisted
    expect(Game.count).to eq 3

    names = ['Foo, Week 1', 'Foo, Week 2', 'Foo, Week 3']
    expect(Game.pluck(:name)).to match_array names

    last_game_starting = DateTime.new(2014, 1, 16, 17, 0, 0)
    expect(Game.order(:starting).last.starting).to eq last_game_starting
  end
end
