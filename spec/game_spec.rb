require_relative '../game'

describe Game do
  let(:game) { Game.new('2021-05-01', true, '2022-10-26') }

  it 'should print publish date' do
    expect(game.publish_date).to eq('2021-05-01')
  end

  it 'should return multiplayer true or false' do
    expect(game.multiplayer).to eq(true)
  end

  it 'should print last played date' do
    expect(game.last_played_at).to eq('2022-10-26')
  end
end
