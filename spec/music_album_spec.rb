require_relative '../music_album'

RSpec.describe MusicAlbum do
  let(:album) { MusicAlbum.new(true, '2022-01-01') }

  describe '#on_spotify' do
    it 'returns the value of on_spotify' do
      expect(album.on_spotify).to eq(true)
    end
  end

  describe '#publish_date' do
    it 'returns the publish_date' do
      expect(album.publish_date).to eq('2022-01-01')
    end
  end
end
