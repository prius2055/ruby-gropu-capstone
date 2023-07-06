require_relative '../label'

describe Label do
  describe '#add_item' do
    let(:label) { Label.new('red', 'Happy') }
    let(:item) { Item.new('genre', 'author', 'label', 'publish_date', 'archived') }

    it 'adds an item to the label' do
      label.add_item(item)
      expect(label.items.size).to eq(1)
      expect(label.items.first).to eq(item)
      expect(item.label).to eq(label)
    end
  end
end
